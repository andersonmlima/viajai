//
//  CategoriesViewController.swift
//  ViajAI
//
//  Created by Reinaldo Neto on 30/09/23.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var categories: [Category] = []
    private var categoriesSelected : [String] = []
    
    required init?(coder: NSCoder, categories: [Category], categoriesSelected: [String]) {
        self.categories = categories
        self.categoriesSelected = categoriesSelected
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var delegate: CategorySelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
    }
    
    func configElements() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryCollectionViewCell.nib(), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    
}

extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.endIndex
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell
        let category = categories[indexPath.row]
        let isSelected = categoriesSelected.contains(where: {$0 == category.id})
        cell?.setupCell(category: category, isSelected: isSelected)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = categories[indexPath.row].name
        let itemSize = item.size(withAttributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12),
        ])
        return CGSize(width: itemSize.width + 30, height: itemSize.height + 20 > 40 ? itemSize.height + 20 : 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cellOfInterest = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell {
            let isSelected = categoriesSelected.contains(where: {$0 == cellOfInterest.id})
            if(isSelected) {
                categoriesSelected = categoriesSelected.filter({$0 != cellOfInterest.id})
                if let category = categories.first(where: {$0.id == cellOfInterest.id}) {
                    self.delegate?.didSelectCategory(category: category, toRemove: true)
                    dismiss(animated: true)
                }
                collectionView.reloadData()
            } else {
                categoriesSelected.append(cellOfInterest.id)
                if let category = categories.first(where: {$0.id == cellOfInterest.id}) {
                    self.delegate?.didSelectCategory(category: category, toRemove: false)
                }
                collectionView.reloadData()
            }
        }
    }
    
}
