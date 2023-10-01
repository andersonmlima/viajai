//
//  CategoriesViewController.swift
//  ViajAI
//
//  Created by Reinaldo Neto on 30/09/23.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let categories: [Category] = [Category(id: "1", name: "Museus", slugifiedName: "museus"), Category(id: "2", name: "Praia", slugifiedName: "praia"), Category(id: "3", name: "Esportes Radicais", slugifiedName: "esportes-radicais"), Category(id: "4", name: "Gastronomia", slugifiedName: "gastronomia"), Category(id: "5", name: "Natureza", slugifiedName: "natureza"), Category(id: "6", name: "Ecoturismo", slugifiedName: "ecoturismo"), Category(id: "7", name: "Montanhas", slugifiedName: "montanhas"), Category(id: "8", name: "Eventos Culturais", slugifiedName: "eventos-culturais"), Category(id: "9", name: "Compras", slugifiedName: "compras"), Category(id: "10", name: "Vida Noturna", slugifiedName: "vida-noturna")]
    
    var categoriesSelected : [String] = ["1", "2", "3", "8", "9"]
    
    var delegate: CategorySelection?
    
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
        let cellOfInterest = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell
        
    }
    
}
