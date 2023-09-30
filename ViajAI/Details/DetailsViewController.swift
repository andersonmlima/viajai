//
//  DetailsViewController.swift
//  ViajAI
//
//  Created by Michael Bressiani on 24/09/23.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageLocalImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageLocalImageView.image = UIImage(named: "rio")
        imageLocalImageView.contentMode = .scaleAspectFill
    }
    
    func elementsConfig() {
        
    }
}
