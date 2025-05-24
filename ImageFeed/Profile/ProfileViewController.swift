import UIKit

final class ProfileViewController: UIViewController {
    
    private let profileImageView = UIImageView()
    private var nameLabel = UILabel()
    private let usernameLabel = UILabel()
    private let messageLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "YP Black")
        
        setupProfileImageView()
        setupNameLabel()
        setupUsernameLabel()
        setupMessageLabel()
        setupButton()
        
    }
    
    private func setupProfileImageView() {
        profileImageView.image = UIImage(named: "Userpick")
        profileImageView.layer.cornerRadius = 35
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            profileImageView.widthAnchor.constraint(equalToConstant: 70),
            profileImageView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    private func setupNameLabel() {
        nameLabel.text = "Екатерина Новикова"
        nameLabel.textColor = UIColor(named: "YP White")
        nameLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupUsernameLabel() {
        usernameLabel.text = "@ekaterina_nov"
        usernameLabel.textColor = UIColor(named: "YP White (Alpha 50) ")
        usernameLabel.font = UIFont.systemFont(ofSize: 13)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameLabel)
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            usernameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            usernameLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
        ])
    }
    
    private func setupMessageLabel() {
        messageLabel.text = "Hello, world!"
        messageLabel.textColor = UIColor(named: "YP White")
        messageLabel.font = UIFont.systemFont(ofSize: 13)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
        ])
    }
    
    private func setupButton() {
           let button = UIButton.systemButton(
            with: UIImage(systemName: "ipad.and.arrow.forward")!,
               target: self,
               action: #selector(didTapButton)
           )
           button.tintColor = UIColor(named: "YP Red")
           button.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(button)

           NSLayoutConstraint.activate([
               button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
               button.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor)
           ])
       }

    @objc private func didTapButton() {
           
            view.subviews.forEach { subview in
                if subview is UILabel {
                    subview.removeFromSuperview()
                }
            }
    
       }
   }
  

