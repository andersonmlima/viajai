//
//  PerfilViewController.swift
//  ViajAI
//
//  Created by Michael Bressiani on 03/10/23.
//

import UIKit

class PerfilViewController: UIViewController {
    
    // Outlets para os elementos da interface do usuário
    @IBOutlet weak var perfilImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var changePhotoPerfilButton: UIButton!
    @IBOutlet weak var verificationButton: UIButton!
    @IBOutlet weak var perfilButton: UIButton!
    @IBOutlet weak var preferencesButton: UIButton!
    @IBOutlet weak var leaveButton: UIButton!
    @IBOutlet weak var perfilDescriptionLabel: UILabel!
    @IBOutlet weak var preferenceDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changePhotoPerfilButton.layer.borderWidth = 1.0
        changePhotoPerfilButton.layer.borderColor = UIColor.lightGray.cgColor
        changePhotoPerfilButton.layer.cornerRadius = 20
        
        verificationButton.layer.borderWidth = 1.0
        verificationButton.layer.borderColor = UIColor.lightGray.cgColor
        verificationButton.layer.cornerRadius = 20
    }
    @IBAction func goLoginButton(_ sender: UIButton) {
//        let viewController = UIStoryboard(name: "LoginViewController", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
//
//            present(viewController ?? UIViewController(), animated: true)
        }
    }
    



