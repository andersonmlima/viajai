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
    }

    
    @IBAction func tappedShowScreen02(_ sender: Any) {
        let screen02 = UIStoryboard(name: "SplashScreenViewController", bundle: nil).instantiateViewController(withIdentifier: "SplashScreenViewController") as? SplashScreenViewController
        
        navigationController?.pushViewController(screen02 ?? UIViewController(), animated: true)
    }
    
    
}

