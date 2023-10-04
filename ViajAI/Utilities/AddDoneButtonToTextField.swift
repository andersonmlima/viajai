//
//  AddDoneButtonToTextField.swift
//  ViajAI
//
//  Created by Reinaldo Neto on 24/09/23.
//

import Foundation
import UIKit

extension UITextField{
    func addDoneButtonToKeyboard(myAction:Selector?, target: Any? = nil){
    let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
    doneToolbar.barStyle = UIBarStyle.default

     let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
     lazy var done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: target ?? self, action: myAction)

    var items = [UIBarButtonItem]()
    items.append(flexSpace)
    items.append(done)

    doneToolbar.items = items
    doneToolbar.sizeToFit()

    self.inputAccessoryView = doneToolbar
 }
}
