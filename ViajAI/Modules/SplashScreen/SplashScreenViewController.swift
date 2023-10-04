//
//  SplashScreenViewController.swift
//  ViajAI
//
//  Created by Felipe Miranda Santos on 11/09/23.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var firstMessageLabel: UILabel!
    @IBOutlet weak var secondMessageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
        moveToLoginView()
    }
    
    func moveToLoginView() {
        let vcString = String(describing: LoginViewController.self)
        let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? LoginViewController
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        })
    }
    
    
    func configElements() {
        logoImage.image = UIImage(named: "SmallLogo")
        
        firstMessageLabel.text = "Comece sua viagem com segurança e diversão"
        firstMessageLabel.textAlignment = .center
        firstMessageLabel.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        firstMessageLabel.textColor = UIColor.black
        firstMessageLabel.numberOfLines = 0
        firstMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        secondMessageLabel.text = "A ideia do ViajAÍ é analisar as preferências do usuário, incluindo interesses em atrações turísticas, atividades culturais, gastronomia, orçamento, entre outros, para criar roteiros personalizados para cada viagem.Viaje sem medo!"     
        secondMessageLabel.textAlignment = .center
        secondMessageLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        secondMessageLabel.textColor = UIColor.gray
        secondMessageLabel.numberOfLines = 0
        secondMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
