//
//  UIViewController.swift
//  Smilometer
//
//  Created by Yuhan Dai on 5/1/17.
//  Copyright © 2017 Yuhan Dai. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    
    func addErrorAlert(errorMessage: String, alertTitle: String){
        // alert user when error occurs
        let errorAlert = UIAlertController(title: alertTitle,
                                           message: errorMessage,
                                           preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (action: UIAlertAction) -> Void in
                                        
        }
        errorAlert.addAction(okAction)
        
        self.present(errorAlert,
                                   animated: true,
                                   completion: nil)
        
    }
}
