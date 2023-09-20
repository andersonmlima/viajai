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
    @IBOutlet weak var resendCodeButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        verificationOneTextField.delegate = self
        verificationTwoTextField.delegate = self
        verificationThreeTextField.delegate = self
        verificationFourTextField.delegate = self
        verificationFiveTextField.delegate = self
        titleLabel.text = "Verificação da Conta"
        let titleFont = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.font = titleFont
        subTitleLabel.text = "Por favor, incluir o código de verificação enviado ao e-mail:"
        subTitleLabel.textColor = UIColor.systemGray2
        subTitleLabel.font = UIFont.systemFont(ofSize: 14)
        verificationButton.setTitle("Verificar", for: .normal)
        resendCodeLabel.text = "Não recebeu o código?"
        configureTextFields()
        configureVerificationButtom()
        configureResendCode()
        verificationButton.addTarget(self, action: #selector(tappedVerificationButton(_:)), for: .touchUpInside)
        resendCodeButton.addTarget(self, action: #selector(tappedVerificationButton), for: .touchUpInside)
        errorMessageLabel.isHidden = true
    }
    
    @IBAction func tappedVerificationButton(_ sender: UIButton) {
    }
    
    func configureTextFields() {
        let textFields = [verificationOneTextField, verificationTwoTextField, verificationThreeTextField, verificationFourTextField, verificationFiveTextField]
        
        for textField in textFields {
            textField?.borderStyle = .roundedRect
            textField?.backgroundColor = UIColor.clear
            textField?.textAlignment = .center
            textField?.font = UIFont.systemFont(ofSize: 18)
            textField?.keyboardType = .numberPad
            textField?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            textField?.layer.borderWidth = 2
            textField?.layer.cornerRadius = 5
            textField?.layer.borderColor = UIColor.gray.cgColor
            textField?.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
            textField?.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
        }
        
        verificationOneTextField?.layer.borderWidth = 2
        verificationOneTextField?.layer.borderColor = UIColor.blue.cgColor
    }
    
    func configureVerificationButtom() {
        verificationButton.backgroundColor = UIColor.systemBlue
        verificationButton.setTitleColor(UIColor.white, for: .normal)
        verificationButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        verificationButton.layer.cornerRadius = 5
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            if text.count == 1 {
                switch textField {
                case verificationOneTextField:
                        verificationTwoTextField.becomeFirstResponder()
                case verificationTwoTextField:
                        verificationThreeTextField.becomeFirstResponder()
                case verificationThreeTextField:
                        verificationFourTextField.becomeFirstResponder()
                case verificationFourTextField:
                        verificationFiveTextField.becomeFirstResponder()
                default:
                    break
                }
            }
        }
    }
    
    func configureResendCode() {
        resendCodeLabel.font = UIFont.systemFont(ofSize: 14)
        resendCodeLabel.textColor = UIColor.systemGray2

        resendCodeButton.setTitle("Reenviar código", for: .normal)
        resendCodeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        resendCodeButton.setTitleColor(UIColor.blue, for: .normal)
    }
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blue.cgColor
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.gray.cgColor
    }
    
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
        
        return true
    }

    }
