//
//  LoginViewModel.swift
//  ViajAI
//
//  Created by Reinaldo Neto on 29/10/23.
//

import Foundation
import UIKit
import GoogleSignIn
import FacebookLogin
import Firebase

class LoginViewModel {
    private var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func loginWithEmail(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                Alert().setNewAlert(target: self.viewController, title: "Alerta", message: "E-mail ou senha inválidos")
            } else {
                self.navigateToTabBarController()
            }
        }
    }
    
    func loginWithGoogle() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: self.viewController) { signInResult, error in
            guard signInResult != nil else {
                Alert().setNewAlert(target: self.viewController, title: "Alerta", message: "Error: \(error?.localizedDescription ?? "Usuário inválido")")
                return
            }
            self.navigateToTabBarController()
        }
    }
    
    func loginWithFacebook(result: FBSDKLoginKit.LoginManagerLoginResult?, error: Error?) {
        if let error = error {
            Alert().setNewAlert(target: self.viewController, title: "Error Facebook login", message: "Error: \(error.localizedDescription)")
            return
        }
        if (result?.isCancelled) == true || (result?.token) == nil {
            return
        }
        self.navigateToTabBarController()
    }
    
    func navigateToTabBarController() {
        let vcString = String(describing: TabBarController.self)
        let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? TabBarController
        self.viewController.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    func navigateToRegisterController() {
        let vcString = String(describing: RegisterViewController.self)
        let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? RegisterViewController
        self.viewController.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
}
