//
//  PerfilViewController.swift
//  ViajAI
//
//  Created by Michael Bressiani on 03/10/23.
//

import UIKit

class PerfilViewController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutButton.setTitle("Logout", for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedLogout(_ sender: Any) {
        RootNavigationController.shared.logout()
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
