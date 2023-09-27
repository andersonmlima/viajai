//
//  RegisterViewController.swift
//  ViajAI
//
//  Created by Fábio Oliveira Alegre on 22/09/23.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var haveaccountButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.keyboardType = .default
        emailTextField.keyboardType = .emailAddress
        passwordTextField.isSecureTextEntry = true
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        registerButton.isEnabled = false
        //registerButton.setTitle("Cadastrar", (0.4), for: .disabled)
        //registerButton.setTitle("Cadastrar", for: .normal)
    }
    
    @IBAction func tappedRegisterButton(_ sender:
                                        UIButton) {
    }
    
    func validateTextField() {
        if nameTextField.text != "" && emailTextField.text != "" && passwordTextField.text != "" {
            print(nameTextField.text ?? "")
            print(emailTextField.text ?? "")
            print(passwordTextField.text ?? "")
            
            registerButton.isEnabled = true
            
        } else {
            registerButton.isEnabled = false
            
        }
        
        
    }
    
}
    
    extension ViewController: UITextFieldDelegate {
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            print(#function)
            textField.layer.borderColor = UIColor.blue.cgColor
            textField.layer.borderWidth = 1
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            print(#function)
            textField.layer.borderWidth = 0
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            print(#function)
            textField.resignFirstResponder()
            return true
        }
        
    }
    
    

  

