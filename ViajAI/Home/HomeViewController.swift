//
//  HomeViewController.swift
//  ViajAI
//
//  Created by Michael Bressiani on 29/09/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var mainDestinationsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
    }
    
    func configElements() {
        mainDestinationsLabel.text = "Principais Expericiencias do ViajAI"
        
    }

}
