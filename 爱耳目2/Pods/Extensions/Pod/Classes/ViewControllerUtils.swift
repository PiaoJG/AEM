//
//  ViewControllerUtils.swift
//  Ahtau
//
//  Created by Mark Hamilton on 5/8/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

public func RootViewController() -> UIViewController? {
    
    guard let rootVC: UIViewController = UIApplication.sharedApplication().keyWindow?.rootViewController else {
        
        return nil
        
    }
    
    return rootVC.presentedViewController ?? nil
    
}

public func ScreenOrientation() -> UIInterfaceOrientation {
    
    return UIApplication.sharedApplication().statusBarOrientation
    
}

public func HorizontalSizeClass() -> UIUserInterfaceSizeClass {
    
    guard let horizSizeClass = RootViewController()?.traitCollection.horizontalSizeClass else {
     
        return UIUserInterfaceSizeClass.Unspecified
        
    }
    
    return horizSizeClass
    
}

public func VerticalSizeClass() -> UIUserInterfaceSizeClass {
    
    guard let vertSizeClass = RootViewController()?.traitCollection.verticalSizeClass else {
        
        return UIUserInterfaceSizeClass.Unspecified
        
    }
    
    return vertSizeClass
    
}

public func ScreenWidth() -> CGFloat {
    
    if ScreenOrientation() == UIInterfaceOrientation.Portrait {
        
        guard let sWidth: CGFloat = UIScreen.mainScreen().bounds.size.width else {
            
            return CGFloat(0)
            
        }
        
        return sWidth
        
    } else {
        
        guard let sHeight: CGFloat = UIScreen.mainScreen().bounds.size.height else {
            
            return CGFloat(0)
            
        }
        
        return sHeight
        
    }
    
}

public func ScreenHeight() -> CGFloat {
    
    if ScreenOrientation() == UIInterfaceOrientation.Portrait {
        
        guard let sHeight: CGFloat = UIScreen.mainScreen().bounds.size.height else {
            
            return CGFloat(0)
            
        }
        
        return sHeight
        
    } else {
        
        guard let sWidth: CGFloat = UIScreen.mainScreen().bounds.size.width else {
            
            return CGFloat(0)
            
        }
        
        return sWidth
        
    }
    
}

public func ScreenBounds() -> CGRect {
    
    guard let sBounds: CGRect = UIScreen.mainScreen().bounds else {
        
        return CGRect()
        
    }
    
    return sBounds
    
}

public func StatusBarHeight() -> CGFloat {
    
    guard let sbHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.height else {
        
        return CGFloat(0)
        
    }
    
    return sbHeight

}

public func ScreenHeightMinusStatusBar() -> CGFloat {
    
    return ( ScreenHeight() - StatusBarHeight() )
    
}