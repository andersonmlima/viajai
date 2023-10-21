//
//  TabBarController.swift
//  ViajAI
//
//  Created by Reinaldo Neto on 03/10/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addControllers()
        configLayout()
    }
    

    func addControllers() {
        let firstVC: UINavigationController = {
            let vcString = String(describing: HomeViewController.self)
            let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? HomeViewController
            let nav = UINavigationController(rootViewController: vc ?? UIViewController())
            nav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
            return nav
        }()
        let secondVC: UINavigationController = {
            let vcString = String(describing: SearchViewController.self)
            let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? SearchViewController
            let nav = UINavigationController(rootViewController: vc ?? UIViewController())
            nav.tabBarItem = UITabBarItem(title: "Busca", image: UIImage(systemName: "magnifyingglass"), tag: 1)
            return nav
        }()
        let thirdVC: UINavigationController = {
            let vcString = String(describing: ListDestinationViewController.self)
            let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? ListDestinationViewController
            let nav = UINavigationController(rootViewController: vc ?? UIViewController())
            nav.tabBarItem = UITabBarItem(title: "Favoritos", image: UIImage(systemName: "star.fill"), tag: 2)
            return nav
        }()
        
        let fourthVC: UINavigationController = {
            let vcString = String(describing: PerfilViewController.self)
            let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? PerfilViewController
            let nav = UINavigationController(rootViewController: vc ?? UIViewController())
            nav.tabBarItem = UITabBarItem(title: "Perfil", image: UIImage(systemName: "person.fill"), tag: 3)
            return nav
        }()

        viewControllers = [firstVC, secondVC, thirdVC, fourthVC]
    }
    
    func configLayout() {
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.backgroundColor = .white
    }

}
