//
//  ViewController.swift
//  ViajAI
//
//  Created by Reinaldo Neto on 10/08/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginScrollView: UIScrollView!
    
    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet weak var wellcomeAppLabel: UILabel!
    
    @IBOutlet weak var textWellcomeAppLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var recoverPasswordChangeButton: UIButton!
    
    @IBOutlet weak var loginChangeButton: UIButton!
    
    @IBOutlet weak var orLabel: UILabel!
    
    @IBOutlet weak var loginGoogleChangeButton: UIButton!
    
    @IBOutlet weak var loginFacebookChangeButton: UIButton!
    
    @IBOutlet weak var textRegisterLabel: UILabel!
    
    @IBOutlet weak var registerChangeButton: UIButton!
    
    @IBOutlet weak var invalidPasswordLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
    }
    
    @IBAction func tappedRecoverPasswordButton(_ sender: UIButton) {
    }
    
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        
        let vcString = String(describing: TabBarController.self)
        let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? TabBarController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedGoogleButton(_ sender: UIButton) {
    }
    
    
    @IBAction func tappedFacebbokButton(_ sender: UIButton) {
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        
        let vcString = String(describing: RegisterViewController.self)
        let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? RegisterViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    
    func configElements() {
        
        loginScrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
        
        emailTextField.borderStyle = .roundedRect
        passwordTextField.borderStyle = .roundedRect

        wellcomeAppLabel.font = UIFont.boldSystemFont(ofSize: 24)
        textWellcomeAppLabel.font = UIFont.systemFont(ofSize: 12)
        wellcomeAppLabel.textColor = UIColor.black
        textWellcomeAppLabel.textColor = UIColor.gray
        textWellcomeAppLabel.numberOfLines = 4
        textWellcomeAppLabel.textAlignment = .justified
//        wellcomeAppLabel.textAlignment = .center
        wellcomeAppLabel.text = "Bem Vindo Viajante"
        textWellcomeAppLabel.text = "Estamos ansiosos para ajudar você a planejar a viagem perfeita. Faça login ou cadastre-se agora mesmo e embarque nesta jornada conosco."
        
        emailTextField.placeholder = "Digite seu e-mail"
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.cornerRadius = 8.0
        
        passwordTextField.placeholder = "Digite sua senha"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.cornerRadius = 8.0
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        
        let buttonText = "Esqueceu a senha?"

        let attributedText = NSAttributedString(string: buttonText, attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])

        recoverPasswordChangeButton.setAttributedTitle(attributedText, for: .normal)
        
//        recoverPasswordChangeButton.setTitle("Esqueceu a senha?", for: .normal)
        recoverPasswordChangeButton.tintColor = UIColor.gray
        recoverPasswordChangeButton.configuration?.titleTextAttributesTransformer =
           UIConfigurationTextAttributesTransformer { incoming in
             var outgoing = incoming
             outgoing.font = UIFont.systemFont(ofSize: 12)
             return outgoing
         }
        
        
        loginChangeButton.setTitle("Entrar", for: .normal)
        loginChangeButton.tintColor = UIColor.white
        loginChangeButton.layer.cornerRadius = 8.0
        
        if let backgroudColor = corHexadecimal(hex: "#5BC0F8") { // Substitua pelo código de cor hexadecimal desejado
            loginChangeButton.backgroundColor = backgroudColor
                }
        
        orLabel.text = "ou"
        orLabel.font = UIFont.systemFont(ofSize: 15)
        orLabel.textColor = UIColor.gray
        
        
        loginGoogleChangeButton.setTitle("Entrar com o Google", for: .normal)
        loginGoogleChangeButton.tintColor = UIColor.black
        loginGoogleChangeButton.layer.borderWidth = 1.0 // Largura da borda em pontos
        loginGoogleChangeButton.layer.borderColor = UIColor.black.cgColor // Cor da borda

        // Opcional: Arredondar as bordas do botão
        loginGoogleChangeButton.layer.cornerRadius = 8.0
        
        loginFacebookChangeButton.setTitle("Entrar com o Facebook", for: .normal)
        loginFacebookChangeButton.tintColor = UIColor.black
        loginFacebookChangeButton.layer.borderWidth = 1.0 // Largura da borda em pontos
        loginFacebookChangeButton.layer.borderColor = UIColor.black.cgColor // Cor da borda

        loginFacebookChangeButton.layer.cornerRadius = 8.0
        
        
        registerChangeButton.setTitle("Sign UP", for: .normal)
        if let textColor = corHexadecimal(hex: "#5BC0F8") {
            registerChangeButton.setTitleColor(textColor, for: .normal)
                }

        textRegisterLabel.text = "Não tem cadastro?"
        textRegisterLabel.font = UIFont.systemFont(ofSize: 14)
        textRegisterLabel.textColor = UIColor.gray
        
        invalidPasswordLabel.text = ""
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
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

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.blue.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        textField.layer.borderWidth = 1.0
        if textField.hasText {
            textField.layer.borderColor = UIColor.lightGray.cgColor
            
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
            
        }
        
        // Verifique se o campo de email está vazio e não está em foco
            if textField == emailTextField && !textField.isFirstResponder {
                if textField.text == "" {
                    textField.layer.borderColor = UIColor.red.cgColor
                } else {
                    textField.layer.borderColor = UIColor.lightGray.cgColor
                }
            }

            // Verifique se o campo de senha está vazio e não está em foco
            if textField == passwordTextField && !textField.isFirstResponder {
                if textField.text == "" {
                    textField.layer.borderColor = UIColor.red.cgColor
                    invalidPasswordLabel.font = UIFont.systemFont(ofSize: 15)
                    invalidPasswordLabel.textColor = UIColor.red
                    invalidPasswordLabel.text = "Senha inválida"
                } else {
                    textField.layer.borderColor = UIColor.lightGray.cgColor
                    invalidPasswordLabel.text = ""
                }
            }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
