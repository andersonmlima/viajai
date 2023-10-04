//
//  CategoryCollectionViewCell.swift
//  ViajAI
//
//  Created by Reinaldo Neto on 30/09/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var horizontalStackView: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var removeImage: UIImageView!
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    private(set) var id: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configElements()
    }
    
    func configElements() {
        horizontalStackView.layer.cornerRadius = horizontalStackView.frame.height / 2
        horizontalStackView.layer.borderWidth = 1
        horizontalStackView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.14).cgColor
        horizontalStackView.spacing = 10
        horizontalStackView.alignment = .center
        horizontalStackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        horizontalStackView.isLayoutMarginsRelativeArrangement = true
        
        removeImage.image = UIImage(systemName: "xmark")
    }
    
    func setupCell(category: Category, iconIsHidden: Bool? = true, isSelected: Bool? = false) {
        id = category.id
        nameLabel.text = category.name
        removeImage.isHidden = iconIsHidden ?? true
        let selected = isSelected ?? false
        if (selected) {
            horizontalStackView.backgroundColor = UIColor(red: 0.129, green: 0.208, blue: 0.333, alpha: 1)
            nameLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        } else {
            horizontalStackView.backgroundColor = .white
            nameLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
}
