//
//  HomeCollectionViewCell.swift
//  ViajAI
//
//  Created by Michael Bressiani on 30/09/23.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoDestinationImageView: UIImageView!
    @IBOutlet weak var nameSubDestinationLabel: UILabel!
    @IBOutlet weak var descriptionDestinationLabel: UILabel!
    
    static let identifier: String = String(describing: HomeCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        photoDestinationImageView.contentMode = .scaleAspectFill
        configElements()
    }
    
    func configElements() {
        nameSubDestinationLabel.font = UIFont.boldSystemFont(ofSize: 15)
        nameSubDestinationLabel.textColor = UIColor.black
        
        descriptionDestinationLabel.font = UIFont.boldSystemFont(ofSize: 13)
        descriptionDestinationLabel.textColor = UIColor.gray
        
    }
    
    func setupCell(photoName: String, subTitles: String, description: String) {
        
        photoDestinationImageView.image = UIImage(named: photoName)
        nameSubDestinationLabel.text = subTitles
        descriptionDestinationLabel.text = description
    }
}
