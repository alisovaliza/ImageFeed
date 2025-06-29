import Foundation

final class OAuth2Service {
    static let shared = OAuth2Service()
    private init() {}
    

    
    func fetchOAuthToken(code: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let request = makeRequest(with: code) else {
            completion(.failure(OAuth2Error.invalidRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(OAuth2Error.noData))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(OAuthTokenResponse.self, from: data)
                let token = response.accessToken
                completion(.success(token))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    private func makeRequest(with code: String) -> URLRequest? {
        guard let url = URL(string: "https://unsplash.com/oauth/token") else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let parameters = [
            "client_id": AccessKey,
            "client_secret": SecretKey,
            "redirect_uri": RedirectURI,
            "code": code,
            "grant_type": "authorization_code"
        ]
        
        let bodyString = parameters.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
        request.httpBody = bodyString.data(using: .utf8)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        return request
    }
}

enum OAuth2Error: Error {
    case invalidRequest
    case noData
}

struct OAuthTokenResponse: Decodable {
    let accessToken: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
}
