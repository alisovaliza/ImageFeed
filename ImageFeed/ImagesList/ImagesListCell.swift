import Foundation
import UIKit

final class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"
    
    @IBOutlet private var cellImage: UIImageView!
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var likeButton: UIButton!
    
    func configure(with image: UIImage, date: String, isLiked: Bool) {
        cellImage.image = image
                dateLabel.text = date
                
                let likeImage = isLiked ? UIImage(named: "FavoritesActive") : UIImage(named: "FavoritesNoActive")
                likeButton.setImage(likeImage, for: .normal)
    }
}
