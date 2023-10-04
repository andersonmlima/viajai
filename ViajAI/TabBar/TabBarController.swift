//
//  TabBarController.swift
//  ViajAI
//
//  Created by Reinaldo Neto on 03/10/23.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addControllers()
        configLayout()
    }
    

    func addControllers() {
        let firstVC: UINavigationController = {
            let vcString = String(describing: ListDestinationViewController.self)
            let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? ListDestinationViewController
            let nav = UINavigationController(rootViewController: vc ?? UIViewController())
            nav.tabBarItem = UITabBarItem(title: "Favoritos", image: UIImage(systemName: "pencil.circle.fill"), tag: 0)
            return nav
        }()
        let secondVC: UINavigationController = {
            let vcString = String(describing: SearchViewController.self)
            let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? SearchViewController
            let nav = UINavigationController(rootViewController: vc ?? UIViewController())
            nav.tabBarItem = UITabBarItem(title: "Busca", image: UIImage(systemName: "pencil.circle.fill"), tag: 1)
            return nav
        }()
        
        viewControllers = [firstVC, secondVC]
    }
    
    func configLayout() {
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.backgroundColor = .white
    }

}
