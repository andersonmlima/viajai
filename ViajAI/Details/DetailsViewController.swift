//
//  DetailsViewController.swift
//  ViajAI
//
//  Created by Michael Bressiani on 24/09/23.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var titleLocalLabel: UILabel!
    @IBOutlet weak var descriptionLocalLabel: UILabel!
    @IBOutlet weak var imageLocalImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elementsConfig()
    }
    
    func elementsConfig() {
        imageLocalImageView.image = UIImage(named: "rio")
        imageLocalImageView.contentMode = .scaleAspectFill
        titleLocalLabel.font = UIFont.systemFont(ofSize: 20)
        descriptionLocalLabel.font = UIFont.boldSystemFont(ofSize: 12)
        
        titleLocalLabel.textColor = UIColor.black
        descriptionLocalLabel.textColor = UIColor.gray
        
        descriptionLocalLabel.numberOfLines = 20
        
        titleLocalLabel.text = "Praia de Copacabana"
        descriptionLocalLabel.text = "Copacabana é um bairro situado na Zona Sul do município do Rio de Janeiro, no Brasil. É considerado um dos bairros mais famosos e prestigiados do Brasil e um dos mais conhecidos do mundo. Tem o apelido de Princesinha do Mar e Coração da Zona Sul."
        
    }
}
