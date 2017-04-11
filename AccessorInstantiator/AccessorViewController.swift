//
//  AccessorViewController.swift
//  AccessorInstantiator
//
//  Created by Victor Nouvellet on 3/13/17.
//  Copyright © 2017 Victor Nouvellet. All rights reserved.
//

import UIKit

class AccessorViewController: UIViewController {
    @IBOutlet var accessorCodeTextView: UITextView!
    
    @IBAction func instantiateAccessorButtonPressed(_ sender: Any) {
        guard JXCoreManager.shared.isStarted else {
            let alert = UIAlertController(title: "Wait for JXcore", message: "JXcore is not ready", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            })
            alert.addAction(defaultAction)
            self.present(alert, animated: true, completion: { _ in })
            return
        }
        
        JXCoreManager.shared.callEventCallback(callbackName: "InstantiateAccessor", params: [accessorCodeTextView.text])
        self.view.endEditing(true)
    }
}
