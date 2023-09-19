//
//  VerificationViewController.swift
//  ViajAI
//
//  Created by Anderson Moura on 14/09/23.
//

import UIKit

class VerificationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var verificationOneTextField: UITextField!
    @IBOutlet weak var verificationTwoTextField: UITextField!
    @IBOutlet weak var verificationThreeTextField: UITextField!
    @IBOutlet weak var verificationFourTextField: UITextField!
    @IBOutlet weak var verificationFiveTextField: UITextField!
    @IBOutlet weak var verificationButton: UIButton!
    @IBOutlet weak var resendCodeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        verificationOneTextField.delegate = self
        verificationTwoTextField.delegate = self
        verificationThreeTextField.delegate = self
        verificationFourTextField.delegate = self
        verificationFiveTextField.delegate = self
        setDefaultTextFieldColor()
        verificationButton.addTarget(self, action: #selector(tappedVerificationButton(_:)), for: .touchUpInside)
    }
    
    func setDefaultTextFieldColor() {
        verificationOneTextField.backgroundColor = UIColor.gray
        verificationTwoTextField.backgroundColor = UIColor.gray
        verificationThreeTextField.backgroundColor = UIColor.gray
        verificationFourTextField.backgroundColor = UIColor.gray
        verificationFiveTextField.backgroundColor = UIColor.gray
        }
    
    @IBAction func tappedVerificationButton(_ sender: UIButton) {
        let isCodeValid =  isVerificationCodeValid()
        if isCodeValid {
        } else {
            displayError()
        }
    }
    
    func isVerificationCodeValid() -> Bool{
        return false
    }
    
    func displayError() {
        verificationOneTextField.backgroundColor = UIColor.red
        verificationTwoTextField.backgroundColor = UIColor.red
        verificationThreeTextField.backgroundColor = UIColor.red
        verificationFourTextField.backgroundColor = UIColor.red
        verificationFiveTextField.backgroundColor = UIColor.red
            
        let errorMessageLabel = UILabel()
        errorMessageLabel.text = "Código de verificação inválido"
        errorMessageLabel.textColor = UIColor.red
        errorMessageLabel.textAlignment = .center
        view.addSubview(errorMessageLabel)
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        errorMessageLabel.topAnchor.constraint(equalTo: verificationButton.bottomAnchor, constant: 16).isActive = true
        }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        
        // Limite o comprimento do texto da caixa de texto a 1 caractere
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        let isSingleCharacter = newText.count <= 1
        
        // Se for um único caractere, avance para o próximo campo ou mude a cor de fundo
        if isSingleCharacter {
            switch textField {
            case verificationOneTextField:
                verificationTwoTextField.becomeFirstResponder()
                textField.backgroundColor = UIColor.blue
            case verificationTwoTextField:
                verificationThreeTextField.becomeFirstResponder()
                textField.backgroundColor = UIColor.blue
            case verificationThreeTextField:
                verificationFourTextField.becomeFirstResponder()
                textField.backgroundColor = UIColor.blue
            case verificationFourTextField:
                verificationFiveTextField.becomeFirstResponder()
                textField.backgroundColor = UIColor.blue
            case verificationFiveTextField:
                verificationFiveTextField.resignFirstResponder()
                textField.backgroundColor = UIColor.blue
            default:
                break
            }
        }
        
        return false
    }

}
