//
//  SearchViewController.swift
//  ViajAI
//
//  Created by Reinaldo Neto on 14/09/23.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var cityView: UIView!
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet weak var countryView: UIView!
    @IBOutlet var countryTextField: UITextField!
    @IBOutlet weak var arriveDateView: UIView!
    @IBOutlet var arriveDateTextField: UITextField!
    @IBOutlet weak var exitDateView: UIView!
    @IBOutlet var exitDateTextField: UITextField!
    @IBOutlet weak var budgetView: UIView!
    @IBOutlet var budgetTextField: UITextField!
    @IBOutlet weak var categoriesView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextFields()
        configKeyboardPadding()
        configCateogryView()
    }
    
    func configKeyboardPadding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = view.convert(keyboardFrame, from: nil)

        var contentInset: UIEdgeInsets = scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        scrollView.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInset: UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
    func configTextFields() {
        countryTextField.delegate = self
        cityTextField.delegate = self
        arriveDateTextField.delegate = self
        exitDateTextField.delegate = self
        budgetTextField.delegate = self
        
        countryTextField.textContentType = .countryName
        cityTextField.textContentType = .addressCity
        arriveDateTextField.textContentType = .dateTime
        exitDateTextField.textContentType = .dateTime
        
        budgetTextField.keyboardType = .numberPad
        arriveDateTextField.keyboardType = .numberPad
        exitDateTextField.keyboardType = .numberPad
        
        budgetTextField.addDoneButtonToKeyboard(myAction: #selector(self.budgetTextField.resignFirstResponder))
        arriveDateTextField.addDoneButtonToKeyboard(myAction: #selector(arriveDateDoneAction), target: self)
        exitDateTextField.addDoneButtonToKeyboard(myAction: #selector(exitDateDoneAction), target: self)
    }
    
    @objc func arriveDateDoneAction() {
        self.exitDateTextField.becomeFirstResponder()
    }
    
    @objc func exitDateDoneAction() {
        self.budgetTextField.becomeFirstResponder()
    }
    
    func configCateogryView() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector (self.openModalCategories))
        self.categoriesView.addGestureRecognizer(gesture)
    }
    
    @objc func openModalCategories() {
        print("openModalCategories")
    }

}


extension SearchViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case cityTextField:
            self.cityView.layer.borderColor = UIColor.blue.cgColor
        case countryTextField:
            self.countryView.layer.borderColor = UIColor.blue.cgColor
        case arriveDateTextField:
            self.arriveDateView.layer.borderColor = UIColor.blue.cgColor
        case exitDateTextField:
            self.exitDateView.layer.borderColor = UIColor.blue.cgColor
        case budgetTextField:
            self.budgetView.layer.borderColor = UIColor.blue.cgColor
        default:
            textField.resignFirstResponder()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case cityTextField:
            self.cityView.layer.borderColor = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1).cgColor
        case countryTextField:
            self.countryView.layer.borderColor = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1).cgColor
        case arriveDateTextField:
            self.arriveDateView.layer.borderColor = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1).cgColor
        case exitDateTextField:
            self.exitDateView.layer.borderColor = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1).cgColor
        case budgetTextField:
            self.budgetView.layer.borderColor = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1).cgColor
        default:
            textField.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case cityTextField:
            self.countryTextField.becomeFirstResponder()
        case countryTextField:
            self.arriveDateTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
    
}
