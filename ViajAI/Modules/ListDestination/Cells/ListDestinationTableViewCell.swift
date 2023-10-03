//
//  ListDestinationTableViewCell.swift
//  ViajAI
//
//  Created by Felipe Miranda Santos on 30/09/23.
//

import UIKit

class ListDestinationTableViewCell: UITableViewCell {
    
//    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var namePlaceLabel: UILabel!
    @IBOutlet weak var descriptionPlaceLabel: UILabel!
    
    
    static let identifier: String = "ListDestinationTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configElements()
    }
    
    func configElements() {
        ratingLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        namePlaceLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        descriptionPlaceLabel.frame = CGRect(x: 0, y: 25, width: 241, height: 44)
        descriptionPlaceLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        descriptionPlaceLabel.lineBreakMode = .byWordWrapping
        placeImageView.frame = CGRect(x: 0, y: 25, width: 241, height: 44)
//        cityLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
    }
    
    func setupCell(listDestination: ListDestination) {
        placeImageView.image = UIImage(named: listDestination.place)
        ratingLabel.text = listDestination.rating
        namePlaceLabel.text = listDestination.namePlace
        descriptionPlaceLabel.text = listDestination.description
//        cityLabel.text = listDestination.cityID
    }

    
}
