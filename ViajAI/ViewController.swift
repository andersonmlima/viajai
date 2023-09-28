//
//  ViewController.swift
//  ViajAI
//
//  Created by Reinaldo Neto on 10/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var irTelaDetalhesChangeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        irTelaDetalhesChangeButton.setTitle("Ir Tela de Detalhes", for: .normal)
    }
    
    
    @IBAction func tappedIrTelaDetalhesButton(_ sender: UIButton) {
        
        let telaDetalhes = UIStoryboard(name: "DetailsViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        title = ""
        navigationController?.pushViewController(telaDetalhes ?? UIViewController(), animated: true)
    }
    
}

