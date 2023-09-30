//
//  ViewController.swift
//  ViajAI
//
//  Created by Reinaldo Neto on 10/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var irTelaHomeChangeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        elementsConfig()
    }
    
    func elementsConfig() {
        irTelaHomeChangeButton.setTitle("Ir para tela de Home", for: .normal)
    }
    
    @IBAction func tappedIrTelaHomeButton(_ sender: UIButton) {
        
//        let telaHome = UIStoryboard(name: "HomeViewController", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
//        
//        
//        navigationController?.pushViewController(telaHome ?? UIViewController(), animated: true)
        
        title = ""
//        title.center
        
        let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil) // Substitua "Main" pelo nome do seu storyboard
        
        if let tabBarController = storyboard.instantiateViewController(withIdentifier: "tabBarHome") as? UITabBarController {
            navigationController?.pushViewController(tabBarController, animated: true)
        }
        
    }
    

}

