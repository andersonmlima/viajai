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

    
    @IBAction func tappedButton(_ sender: Any) {

        let viewController = UIStoryboard(name: "RegisterViewController", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)


        


    }
    
    
    
    
    
    

}

