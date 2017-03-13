//
//  UIAlertUtils.swift
//  Ahtau
//
//  Created by Mark Hamilton on 5/5/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

public func showErrorAlert(description: String, error: NSError? = nil, sender: UIViewController) {
    
    // Set Text of Alert
    let text: String = (error != nil) ? "Error description: \(description), error: \(error)" : "Error description: \(description)"
    
    // Setup Alert Controller
    let alertController = UIAlertController(title: "Error", message: text, preferredStyle: .Alert)
    let alertAction = UIAlertAction(title: "Dismiss", style: .Default, handler: nil)
    alertController.addAction(alertAction)
    
    // Present Alert using Sender View Controller
    sender.presentViewController(alertController, animated: true, completion: nil)
    
}

public func showErrorAlertUsingRoot(description: String, error: NSError? = nil) {
    
    // Set Text of Alert
    let text: String = (error != nil) ? "Error description: \(description), error: \(error)" : "Error description: \(description)"
    
    // Setup Alert Controller
    let alertController = UIAlertController(title: "Error", message: text, preferredStyle: .Alert)
    let alertAction = UIAlertAction(title: "Dismiss", style: .Default, handler: nil)
    alertController.addAction(alertAction)
    
    // Present Alert using Root View Controller
    RootViewController()?.presentViewController(alertController, animated: true, completion: nil)
    
}