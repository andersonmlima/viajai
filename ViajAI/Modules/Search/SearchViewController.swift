//
//  SearchViewController.swift
//  ViajAI
//
//  Created by Reinaldo Neto on 14/09/23.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var cityView: UIView!
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var countryView: UIView!
    @IBOutlet var countryTextField: UITextField!
    @IBOutlet var arriveDateView: UIView!
    @IBOutlet var arriveDateTextField: UITextField!
    @IBOutlet var exitDateView: UIView!
    @IBOutlet var exitDateTextField: UITextField!
    @IBOutlet var budgetView: UIView!
    @IBOutlet var budgetTextField: UITextField!
    @IBOutlet var categoriesView: UIView!
    @IBOutlet var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var openActionSheetContainerView: UIView!
    @IBOutlet weak var openActionSheetImageView: UIImageView!

    let categories: [Category] = [Category(id: "1", name: "Museus", slugifiedName: "museus"), Category(id: "2", name: "Praia", slugifiedName: "praia"), Category(id: "3", name: "Esportes Radicais", slugifiedName: "esportes-radicais"), Category(id: "4", name: "Gastronomia", slugifiedName: "gastronomia"), Category(id: "5", name: "Natureza", slugifiedName: "natureza"), Category(id: "6", name: "Ecoturismo", slugifiedName: "ecoturismo"), Category(id: "7", name: "Montanhas", slugifiedName: "montanhas"), Category(id: "8", name: "Eventos Culturais", slugifiedName: "eventos-culturais"), Category(id: "9", name: "Compras", slugifiedName: "compras"), Category(id: "10", name: "Vida Noturna", slugifiedName: "vida-noturna")]
    
    var categoriesSelected : [String] = ["1", "2", "3", "8", "9"]

    override func viewDidLoad() {
        super.viewDidLoad()
        configTextFields()
        configKeyboardPadding()
        configCategoryView()
        configCollectionView()
    }

    // MARK: - Configuring the observers to Keyboard

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

    // MARK: - Configuring text field and their objc functions to done button

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

        budgetTextField.addDoneButtonToKeyboard(myAction: #selector(budgetTextField.resignFirstResponder))
        arriveDateTextField.addDoneButtonToKeyboard(myAction: #selector(arriveDateDoneAction), target: self)
        exitDateTextField.addDoneButtonToKeyboard(myAction: #selector(exitDateDoneAction), target: self)
    }

    @objc func arriveDateDoneAction() {
        exitDateTextField.becomeFirstResponder()
    }

    @objc func exitDateDoneAction() {
        budgetTextField.becomeFirstResponder()
    }
    
    @IBAction func tappedSearch(_ sender: Any) {
        let vcString = String(describing: MapViewController.self)
        let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? MapViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
}

// MARK: - Text field

extension SearchViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case cityTextField:
            cityView.layer.borderColor = UIColor.blue.cgColor
        case countryTextField:
            countryView.layer.borderColor = UIColor.blue.cgColor
        case arriveDateTextField:
            arriveDateView.layer.borderColor = UIColor.blue.cgColor
        case exitDateTextField:
            exitDateView.layer.borderColor = UIColor.blue.cgColor
        case budgetTextField:
            budgetView.layer.borderColor = UIColor.blue.cgColor
        default:
            textField.resignFirstResponder()
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case cityTextField:
            cityView.layer.borderColor = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1).cgColor
        case countryTextField:
            countryView.layer.borderColor = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1).cgColor
        case arriveDateTextField:
            arriveDateView.layer.borderColor = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1).cgColor
        case exitDateTextField:
            exitDateView.layer.borderColor = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1).cgColor
        case budgetTextField:
            budgetView.layer.borderColor = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1).cgColor
        default:
            textField.resignFirstResponder()
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case cityTextField:
            countryTextField.becomeFirstResponder()
        case countryTextField:
            arriveDateTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
}

// MARK: - Configuring the category view to open the modal with the types of category
extension SearchViewController: UIGestureRecognizerDelegate {
    func configCategoryView() {
        // FIXME: When tap to remove the collection view cell, is calling the openModal together
        let gesture = UITapGestureRecognizer(target: self, action: #selector(openModalCategories))
        gesture.delegate = self
        gesture.cancelsTouchesInView = false
        openActionSheetContainerView.addGestureRecognizer(gesture)
        openActionSheetContainerView.backgroundColor = .white
        openActionSheetImageView.image = UIImage(systemName: "chevron.down")
        openActionSheetImageView.tintColor = .gray
    }

    @objc func openModalCategories(_ sender: UIGestureRecognizer) {
        let identifier = String(describing: CategoriesViewController.self)
        let vc = UIStoryboard(name: identifier, bundle: nil).instantiateViewController(identifier: identifier) { coder -> CategoriesViewController? in
            return CategoriesViewController(coder: coder, categories: self.categories, categoriesSelected: self.categoriesSelected)
        }
        vc.delegate = self
        vc.modalPresentationStyle = .formSheet
        vc.sheetPresentationController?.detents = [.medium()]
        vc.sheetPresentationController?.prefersGrabberVisible = true
        present(vc, animated: true)
        
    }
}

// MARK: - Config collection view

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func configCollectionView() {
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(CategoryCollectionViewCell.nib(), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        if let layout = categoriesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero
            layout.minimumLineSpacing = 2
            layout.minimumInteritemSpacing = 2
        }
    }
    
    func removeAndReloadCollectionView(id: String) {
        categoriesSelected = categoriesSelected.filter({$0 != id})
        categoriesCollectionView.reloadData()
    }
    
    func addSelectedAndReloadCollectionView(id: String) {
        categoriesSelected.append(id)
        categoriesCollectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesSelected.endIndex
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell
        let idSelected = categoriesSelected[indexPath.row]
        let categorySelected = categories.filter({$0.id == idSelected})
        cell?.setupCell(category: categorySelected[0], iconIsHidden: false)
        return cell ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let idSelected = categoriesSelected[indexPath.row]
        let categorySelected = categories.filter({$0.id == idSelected})
        let item = categorySelected[0].name
        let itemSize = item.size(withAttributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12),
        ])
        return CGSize(width: itemSize.width + 60, height: itemSize.height + 20 > 40 ? itemSize.height + 20 : 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellOfInterest = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell
        if let id = cellOfInterest?.id {
            removeAndReloadCollectionView(id: id)
        }
    }
}

// MARK: - Protocol Category Selection
extension SearchViewController: CategorySelectionDelegate {
    func didSelectCategory(category: Category, toRemove: Bool) {
        if(toRemove) {
            removeAndReloadCollectionView(id: category.id)
        } else {
            addSelectedAndReloadCollectionView(id: category.id)
        }
    }
}
