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
    @IBOutlet weak var searchMapChangeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elementsConfig()
    }
    
    @IBAction func tappedSearchMapButton(_ sender: UIButton) {
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
        
        searchMapChangeButton.setTitle("Entrar", for: .normal)
        searchMapChangeButton.tintColor = UIColor.white
        searchMapChangeButton.backgroundColor = UIColor.blue
        searchMapChangeButton.layer.cornerRadius = 8.0
        
        func corHexadecimal(hex: String) -> UIColor? {
                    var limpoHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
                    limpoHex = limpoHex.replacingOccurrences(of: "#", with: "")

                    var rgb: UInt64 = 0

                    Scanner(string: limpoHex).scanHexInt64(&rgb)

                    let vermelho = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
                    let verde = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
                    let azul = CGFloat(rgb & 0x0000FF) / 255.0

                    return UIColor(red: vermelho, green: verde, blue: azul, alpha: 1.0)
                }
        
    }
}
