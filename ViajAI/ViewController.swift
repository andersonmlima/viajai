//
//  ViewController.swift
//  ViajAI
//
//  Created by Reinaldo Neto on 10/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedNavigation(_ sender: UIButton) {
        let viewController = UIStoryboard(name: "VerificationViewStoryboard", bundle: nil).instantiateViewController(withIdentifier: "VerificationViewController") as? VerificationViewController
                self.navigationController?.pushViewController(viewController ?? UIViewController(), animated: false)
    }
    
}

