//
//  SplashScreenViewController.swift
//  ViajAI
//
//  Created by Felipe Miranda Santos on 11/09/23.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var firstMessageLabel: UILabel!
    @IBOutlet weak var secondMessageLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
    }
    
    
    func configElements() {
        logoLabel.text = "ViajAÍ"
        logoLabel.textAlignment = .center
        
        firstMessageLabel.text = "Comece sua viagem com segurança e diversão"
        firstMessageLabel.textAlignment = .center
        firstMessageLabel.font = UIFont.boldSystemFont(ofSize: 20)
        firstMessageLabel.textColor = UIColor.black
        firstMessageLabel.numberOfLines = 0
        firstMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        secondMessageLabel.text = "A ideia do ViajAÍ é analisar as preferências do usuário, incluindo interesses em atrações turísticas, atividades culturais, gastronomia, orçamento, entre outros, para criar roteiros personalizados para cada viagem.                      Viaje sem medo!"
        secondMessageLabel.textAlignment = .center
        secondMessageLabel.font = UIFont.systemFont(ofSize: 15)
        secondMessageLabel.textColor = UIColor.gray
        secondMessageLabel.numberOfLines = 0
        secondMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.image = UIImage(named: "Mask group")
        
    }
    
}
