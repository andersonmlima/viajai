//
//  UIAlertController+setAlert.swift
//  ViajAI
//
//  Created by Reinaldo Neto on 21/10/23.
//

import Foundation
import UIKit

struct Alert {
    func setNewAlert(target: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message , preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        target.self.present(alert, animated: true, completion: nil)
    }
}
