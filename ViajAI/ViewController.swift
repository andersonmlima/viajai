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
    
    @IBAction func tappedShowScree02(_ sender: Any) {
        let screen02 = UIStoryboard(name: "ListDestinationViewController", bundle: nil).instantiateViewController(withIdentifier: "ListDestinationViewController") as? ListDestinationViewController
        
        navigationController?.pushViewController(screen02 ?? UIViewController(), animated: true)
        
    }
    

}

