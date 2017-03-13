//
//  UIAlertControllerExtensions.swift
//  Ahtau
//
//  Created by Mark Hamilton on 4/26/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

public extension UIAlertController {
    
    public func show() {
        
        RootViewController()?.presentViewController(self, animated: true, completion: nil)
        
    }
    
    public func showWithCompletion(completion: () -> Void) {
        
        RootViewController()?.presentViewController(self, animated: true, completion: completion)
        
    }
    
    public var setVisible: Bool {
        
        get {
        
            return self.setVisible
        
        }
        
        set {
            
            if newValue == true {
                
                show()
                
            }
            
            self.setVisible = newValue
            
        }
        
    }
    
}