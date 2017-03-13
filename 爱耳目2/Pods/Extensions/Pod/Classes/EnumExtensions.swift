//
//  EnumExtensions.swift
//  Ahtau
//
//  Created by Mark Hamilton on 4/9/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation


public func iterateOverEnum<T: Hashable>(_: T.Type) -> AnyGenerator<T> {
    
    var x = 0
    
    return AnyGenerator {
        
        let y = withUnsafePointer(&x) {
            
            UnsafePointer<T>($0).memory
            
        }
        
        if y.hashValue == x {
            
            x += 1
            return y
            
        } else {
            
            return nil
            
        }
        
    }
    
}

public func iterateEnum<T: Hashable>(_: T.Type) -> AnyGenerator<T> {
    var x = 0
    
    return AnyGenerator {
        
        let next = withUnsafePointer(&x) { UnsafePointer<T>($0).memory }
    
        defer {
            
            x += 1
            
        }
        
        return next.hashValue == x ? next : nil
    
    }
}

// Error
//public extension RawRepresentable where Self : Hashable {
//
//    public mutating func iterateOver<T : Hashable>(_: T.Type) -> AnyGenerator<T> {
//
//
//        var x = 0
//
//        return AnyGenerator {
//
//            let y = withUnsafePointer(&x) {
//
//                UnsafePointer<T>($0).memory
//
//            }
//
//            let z = x
//
//            if y.hashValue == z {
//
//                x += 1
//                return y
//
//            } else {
//
//                return nil
//
//            }
//
//        }
//
//    }
//
//}

// Error
//public extension RawRepresentable where Self : Hashable {
//
//
//    public func iterate() -> AnyGenerator<Self> {
//
//        return iterateOver(self)
//
//    }
//
//}
//
//let textvar = ColorType.iterate()

//let testVar = iterateOver(ColorType)