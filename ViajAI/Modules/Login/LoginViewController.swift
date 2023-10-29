//
//  ViewController.swift
//  ViajAI
//
//  Created by Reinaldo Neto on 10/08/23.
//

import Firebase
import UIKit
import GoogleSignIn
import FacebookLogin

class LoginViewController: UIViewController {
    
    @IBOutlet var wellcomeAppLabel: UILabel!
    @IBOutlet var textWellcomeAppLabel: UILabel!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var recoverPasswordChangeButton: UIButton!
    @IBOutlet var loginChangeButton: UIButton!
    @IBOutlet var orLabel: UILabel!
    @IBOutlet var loginGoogleChangeButton: UIButton!
    @IBOutlet var loginFacebookChangeButton: UIButton!
    @IBOutlet var registerChangeButton: UIButton!
    @IBOutlet var invalidEmailLabel: UILabel!
    @IBOutlet var invalidPasswordLabel: UILabel!
    
    let facebookLoginButton = FBLoginButton(frame: .zero)

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
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                Alert().setNewAlert(target: self, title: "Alerta", message: "E-mail ou senha inválidos")
            } else {
                let vcString = String(describing: TabBarController.self)
                let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? TabBarController
                self.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
            }
        }
    }

    @IBAction func tappedGoogleButton(_ sender: UIButton) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard signInResult != nil else {
                Alert().setNewAlert(target: self, title: "Alerta", message: "Error: \(error?.localizedDescription ?? "Usuário inválido")")
                return
            }
            let vcString = String(describing: TabBarController.self)
            let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? TabBarController
            self.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        }
    }

    @IBAction func tappedFacebookButton(_ sender: UIButton) {
        facebookLoginButton.sendActions(for: .touchUpInside)
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        let vcString = String(describing: RegisterViewController.self)
        let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? RegisterViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }

    @IBOutlet var textRegisterLabel: UILabel!

    func configElements() {
        wellcomeAppLabel.font = UIFont.boldSystemFont(ofSize: 25)
        textWellcomeAppLabel.font = UIFont.systemFont(ofSize: 15)
        wellcomeAppLabel.textColor = UIColor.black
        textWellcomeAppLabel.textColor = UIColor.gray
        textWellcomeAppLabel.numberOfLines = 4
        textWellcomeAppLabel.textAlignment = .justified
        wellcomeAppLabel.textAlignment = .center

        wellcomeAppLabel.text = "Bem Vindo Viajante"
        textWellcomeAppLabel.text = "Estamos ansiosos para ajudar você a planejar a viagem perfeita. Faça login ou cadastre-se agora mesmo e embarque nesta jornada conosco."
        emailTextField.placeholder = "Digite seu e-mail"
        passwordTextField.placeholder = "Digite sua senha"
        emailTextField.layer.borderWidth = 1.0

        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.borderWidth = 1.0
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor

        recoverPasswordChangeButton.setTitle("Esqueceu a senha?", for: .normal)
        recoverPasswordChangeButton.tintColor = UIColor.gray
        recoverPasswordChangeButton.configuration?.titleTextAttributesTransformer =
            UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = UIFont.systemFont(ofSize: 14)
                return outgoing
            }

        loginChangeButton.setTitle("Entrar", for: .normal)
        loginChangeButton.tintColor = UIColor.white
        loginChangeButton.backgroundColor = UIColor.blue
        loginChangeButton.layer.cornerRadius = 8.0

        if let corDeFundo = corHexadecimal(hex: "#5BC0F8") { // Substitua pelo código de cor hexadecimal desejado
            loginChangeButton.backgroundColor = corDeFundo
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
        
        facebookLoginButton.delegate = self
        facebookLoginButton.isHidden = true

        // Opcional: Arredondar as bordas do botão
        loginFacebookChangeButton.layer.cornerRadius = 8.0

        registerChangeButton.setTitle("Sign Up", for: .normal)

        textRegisterLabel.text = "Não tem cadastro?"
        textRegisterLabel.font = UIFont.systemFont(ofSize: 15)
        textRegisterLabel.textColor = UIColor.gray

        invalidEmailLabel.text = ""
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
                invalidEmailLabel.font = UIFont.systemFont(ofSize: 15)
                invalidEmailLabel.textColor = UIColor.red
                invalidEmailLabel.text = "E-mail inválido"
            } else {
                textField.layer.borderColor = UIColor.lightGray.cgColor
                invalidEmailLabel.text = ""
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

extension LoginViewController: LoginButtonDelegate {
    func loginButton(_ loginButton: FBSDKLoginKit.FBLoginButton, didCompleteWith result: FBSDKLoginKit.LoginManagerLoginResult?, error: Error?) {
        if let error = error {
            Alert().setNewAlert(target: self, title: "Error Facebook login", message: "Error: \(error.localizedDescription)")
            return
        }
        if (result?.isCancelled) == true || (result?.token) == nil {
            return
        }
        let vcString = String(describing: TabBarController.self)
        let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? TabBarController
        self.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginKit.FBLoginButton) {
        //
    }
}
