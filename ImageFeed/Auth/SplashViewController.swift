import Foundation
import UIKit

final class SplashViewController: UIViewController {
    private let storage = OAuth2TokenStorage()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if let token = storage.token {
            switchToTabBarController()
        } else {
            performSegue(withIdentifier: "ShowAuth", sender: nil)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAuth" {
            guard
                let navController = segue.destination as? UINavigationController,
                let authVC = navController.viewControllers.first as? AuthViewController
            else {
                assertionFailure("ShowAuth segue setup is incorrect")
                return
            }

            authVC.delegate = self
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }

    private func switchToTabBarController() {
        guard let window = UIApplication.shared.windows.first else {
            assertionFailure("Invalid window configuration")
            return
        }

        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let tabBarController = storyboard.instantiateViewController(withIdentifier: "TabBarViewController")

        window.rootViewController = tabBarController
    }
}

extension SplashViewController: AuthViewControllerDelegate {
    func didAuthenticate(_ vc: AuthViewController) {
        vc.dismiss(animated: true) {
            self.switchToTabBarController()
        }
    }
}
