//
//  CategoriesViewController.swift
//  ViajAI
//
//  Created by Reinaldo Neto on 30/09/23.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    let categories: [Category] = [Category(id: "1", name: "Museus", slugifiedName: "museus"), Category(id: "2", name: "Praia", slugifiedName: "praia"), Category(id: "3", name: "Esportes Radicais", slugifiedName: "esportes-radicais"), Category(id: "4", name: "Gastronomia", slugifiedName: "gastronomia"), Category(id: "5", name: "Natureza", slugifiedName: "natureza"), Category(id: "6", name: "Ecoturismo", slugifiedName: "ecoturismo"), Category(id: "7", name: "Montanhas", slugifiedName: "montanhas"), Category(id: "8", name: "Eventos Culturais", slugifiedName: "eventos-culturais"), Category(id: "9", name: "Compras", slugifiedName: "compras"), Category(id: "10", name: "Vida Noturna", slugifiedName: "vida-noturna")]

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var stackContainerView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configElements()
    }
    
    func configElements() {
        
        for category in categories {
            let customCell = CategoryCollectionViewCell.nib().instantiate(withOwner: nil).first as! CategoryCollectionViewCell
            customCell.setupCell(category: category)
            stackContainerView.addArrangedSubview(customCell)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
