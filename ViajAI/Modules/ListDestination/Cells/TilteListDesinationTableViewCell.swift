//
//  TilteListDesinationTableViewCell.swift
//  ViajAI
//
//  Created by Felipe Miranda Santos on 02/10/23.
//

import UIKit

class TilteListDesinationTableViewCell: UITableViewCell {

    @IBOutlet weak var TitleNameLabel: UILabel!
    
    static let identifier: String = "TilteListDesinationTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(listDestination: ListDestinationTitle) {
        TitleNameLabel.text = listDestination.nameTitle
    }

}
