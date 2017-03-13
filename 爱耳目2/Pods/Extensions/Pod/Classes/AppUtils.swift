//
//  AppUtils.swift
//  Ahtau
//
//  Created by Mark Hamilton on 5/8/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

public func AppDisplayName() -> String? {
    
    guard let displayName = NSBundle.mainBundle().objectForInfoDictionaryKey("CGBundleDisplayName") as? String else {
        
        guard let name: String = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as? String else {
            
            return nil
            
        }
        
        return name
        
    }
    
    return displayName
    
}

public func AppVersion() -> String? {
    
    guard let version: String = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as? String else {
        
        return nil
        
    }
    
    return version
    
}

public func AppBuildNumber() -> String? {
    
    guard let build: String = NSBundle.mainBundle().objectForInfoDictionaryKey(kCFBundleVersionKey as String) as? String else {
        
        return nil
        
    }
    
    return build
    
}

public func AppBuildVersion() -> String? {
 
    guard let version: String = AppVersion(), build: String = AppBuildNumber() else {
        
        return nil
        
    }
    
    if version == build {
        
        return "v" + version
        
    } else {
        
        return "v" + version + "(" + build + ")"
        
    }
    
}

public func DeviceVersion() -> String? {
    
    var x = 0
    
    sysctlbyname("hw.machine", nil, &x, nil, 0)
    
    var device = [CChar](count: x, repeatedValue: 0)
    
    sysctlbyname("hw.machine", &device, &x, nil, 0)
    
    return String.fromCString(device)
    
}

public func DetectScreenshot(completion: () -> ()) {
    
    let queue = NSOperationQueue.mainQueue()
    
    NSNotificationCenter.defaultCenter().addObserverForName(UIApplicationUserDidTakeScreenshotNotification, object: nil, queue: queue) {
        
        notification in
        
        completion()
        
    }
    
}

public func IsDebug() -> Bool {
    
    #if DEBUG
        return true
    #else
        return false
    #endif
    
}

public func IsRelease() -> Bool {
    
    #if DEBUG
        return false
    #else
        return true
    #endif
    
}

public func IsSimulator() -> Bool {
    
    #if ( (arch(i386)) || (arch(x86_64)) ) && os(iOS)
        return true
    #else
        return false
    #endif
    
}


public func IsDevice() -> Bool {
    
    #if ( (arch(i386)) || (arch(x86_64)) ) && os(iOS)
        return false
    #else
        return true
    #endif
    
}