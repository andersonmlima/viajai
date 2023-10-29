//
//  RootNavigationController.swift
//  ViajAI
//
//  Created by Reinaldo Neto on 29/10/23.
//

import Foundation
import UIKit

class RootNavigationController {
    static let shared = RootNavigationController()

    private var navigationController: UINavigationController?

    private init() {}

    func setNavigationController(navigationController: UINavigationController?) {
        if let navigationController = navigationController {
            self.navigationController = navigationController
        }
    }

    func logout() {
        let vcString = String(describing: LoginViewController.self)
        let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? LoginViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
}
