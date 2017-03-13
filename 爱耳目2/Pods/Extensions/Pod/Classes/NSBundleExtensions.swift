//
//  NSBundleExtensions.swift
//  Ahtau
//
//  Created by Mark Hamilton on 4/26/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

public extension NSBundle {
    
    public class func loadNib(name: String, owner: AnyObject!) {
        
        NSBundle.mainBundle().loadNibNamed(name, owner: owner, options: nil)[0]
        
    }
    
    public class func loadNib<T>(name: String) -> T? {
        
        return NSBundle.mainBundle().loadNibNamed(name, owner: nil, options: nil)[0] as? T
        
    }
    
}