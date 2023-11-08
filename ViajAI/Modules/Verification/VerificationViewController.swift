//
//  VerificationViewController.swift
//  ViajAI
//
//  Created by Anderson Moura on 14/09/23.
// teste

import UIKit

class VerificationViewController: UIViewController, UITextFieldDelegate {
    
    // ViewModel associada a esta View Controller
    var viewModel: VerificationViewModel!
    
    // Código de verificação fixo para fins de exemplo
    var codeVerification = "12345"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var verificationOneTextField: UITextField!
    @IBOutlet weak var verificationTwoTextField: UITextField!
    @IBOutlet weak var verificationThreeTextField: UITextField!
    @IBOutlet weak var verificationFourTextField: UITextField!
    @IBOutlet weak var verificationFiveTextField: UITextField!
    @IBOutlet weak var verificationButton: UIButton!
    @IBOutlet weak var resendCodeLabel: UILabel!
    @IBOutlet weak var resendCodeButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Inicializa a ViewModel com um código de verificação padrão durante o carregamento da tela
        viewModel = VerificationViewModel(codeVerification: VerificationCode(code: "12345"))
        
        // Configuração inicial da interface do usuário
        verificationOneTextField.delegate = self
        verificationTwoTextField.delegate = self
        verificationThreeTextField.delegate = self
        verificationFourTextField.delegate = self
        verificationFiveTextField.delegate = self
        
        // Configuração dos elementos da interface do usuário
        titleLabel.text = "Verificação da Conta"
        let titleFont = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.font = titleFont
        subTitleLabel.text = "Por favor, incluir o código de verificação enviado ao e-mail"
        subTitleLabel.textColor = UIColor.systemGray2
        subTitleLabel.font = UIFont.systemFont(ofSize: 12)
        verificationButton.setTitle("Verificar", for: .normal)
        resendCodeLabel.text = "Não recebeu o código?"
        configureTextFields()
        configureVerificationButtom()
        configureResendCode()
        
        // Definir os métodos de ação para os botões
        verificationButton.addTarget(self, action: #selector(tappedVerificationButton(_:)), for: .touchUpInside)
        resendCodeButton.addTarget(self, action: #selector(tappedVerificationButton), for: .touchUpInside)
        errorMessageLabel.isHidden = true
    }
    
    // Função chamada quando o botão de verificação é pressionado
    @IBAction func tappedVerificationButton(_ sender: UIButton) {
        let enteredCode = "\(verificationOneTextField.text!)\(verificationTwoTextField.text!)\(verificationThreeTextField.text!)\(verificationFourTextField.text!)\(verificationFiveTextField.text!)"
        
        if enteredCode == codeVerification {
            // Código correto, realizar ação necessária
        } else {
            // Código incorreto, mostrar mensagem de erro e bordas vermelhas
            showInvalidCodeError()
        }
    }
    
    // Função chamada quando o botão de reenvio de código é pressionado
    @IBAction func tappedResendCodeButton(_ sender: UIButton) {
    }
    
    // Função para configurar os campos de texto
    func configureTextFields() {
        let textFields = [verificationOneTextField, verificationTwoTextField, verificationThreeTextField, verificationFourTextField, verificationFiveTextField]
        
        for textField in textFields {
            textField?.borderStyle = .roundedRect
            textField?.backgroundColor = UIColor.clear
            textField?.textAlignment = .center
            textField?.font = UIFont.systemFont(ofSize: 16)
            textField?.keyboardType = .numberPad
            textField?.layer.borderWidth = 1
            textField?.layer.cornerRadius = 8
            textField?.layer.borderColor = UIColor.systemGray2.cgColor
            textField?.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
            textField?.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
        }
        
        verificationOneTextField?.layer.borderWidth = 1
        verificationOneTextField?.layer.borderColor = UIColor(hex: "#85D3FF").cgColor
    }
    
    // Função para configurar o botão de verificação
    func configureVerificationButtom() {
        verificationButton.backgroundColor = UIColor(hex: "#85D3FF")
        verificationButton.setTitleColor(UIColor.white, for: .normal)
        verificationButton.layer.cornerRadius = 8
    }
    
    // Função para verificar e atualizar o estado do botão de verificação
    // Verificar se todos os campos de texto estão preenchidos
    // Atualizar o estado do botão de verificação com base nisso
    func updateVerificationButtonState() {
        let textFields = [verificationOneTextField, verificationTwoTextField, verificationThreeTextField, verificationFourTextField, verificationFiveTextField]
        let allFieldsFilled = textFields.allSatisfy { $0?.text?.isEmpty == false }
        verificationButton.isEnabled = allFieldsFilled
    }
    
    // Função para configurar o botão de reenvio de código
    func configureResendCode() {
        resendCodeLabel.textColor = UIColor.systemGray2
        resendCodeLabel.font = UIFont.systemFont(ofSize: 14)
        resendCodeButton.setTitle("Reenviar código", for: .normal)
        resendCodeButton.setTitleColor(UIColor.black, for: .normal)
        resendCodeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        resendCodeButton.contentHorizontalAlignment = .right
    }
    
    // Função para mostrar mensagem de erro quando o código é inválido
    // Mostrar a mensagem de erro e destacar os campos de texto com bordas vermelhas
    func showInvalidCodeError() {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = "Código de verificação inválido"
        errorMessageLabel.font = UIFont.systemFont(ofSize: 12)
        errorMessageLabel.textColor = UIColor.red
        
        let textFields = [verificationOneTextField, verificationTwoTextField, verificationThreeTextField, verificationFourTextField, verificationFiveTextField]
        for textField in textFields {
            textField?.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    // Função para ocultar a mensagem de erro e restaurar as bordas dos campos de texto
    func hideInvalidCodeError() {
        errorMessageLabel.isHidden = true
        
        let textFields = [verificationOneTextField, verificationTwoTextField, verificationThreeTextField, verificationFourTextField, verificationFiveTextField]
        for textField in textFields {
            textField?.layer.borderColor = UIColor(hex: "#85D3FF").cgColor
        }
    }
    
    // Função chamada quando o usuário começa a editar um campo de texto
    // Destacar o campo de texto atual com uma borda azul
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(hex: "#85D3FF").cgColor
        hideInvalidCodeError()
    }
    
    // Função chamada quando o usuário termina de editar um campo de texto
    // Restaurar a borda do campo de texto para a cor padrão
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.systemGray2.cgColor
        updateVerificationButtonState()
    }
    
    // Função chamada quando o usuário insere ou remove caracteres de um campo de texto
    // Lógica para permitir apenas um caractere em cada campo de texto e avançar para o próximo campo
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        let isSingleCharacter = newText.count <= 1
        
        if isSingleCharacter {
            textField.text = newText
            switch textField {
            case verificationOneTextField:
                verificationTwoTextField.becomeFirstResponder()
            case verificationTwoTextField:
                verificationThreeTextField.becomeFirstResponder()
            case verificationThreeTextField:
                verificationFourTextField.becomeFirstResponder()
            case verificationFourTextField:
                verificationFiveTextField.becomeFirstResponder()
            case verificationFiveTextField:
                verificationFiveTextField.resignFirstResponder()
            default:
                break
            }
        }
        
        updateVerificationButtonState()
        return true
    }
    
}

// Extensão para UIColor para criar cores a partir de códigos hexadecimais
// Lógica para criar uma cor a partir de um código hexadecimal
extension UIColor {
    convenience init(hex: String) {
        var sanitizedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        sanitizedHex = sanitizedHex.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: sanitizedHex).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
