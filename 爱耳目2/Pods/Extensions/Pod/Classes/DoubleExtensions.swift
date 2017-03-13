//
//  DoubleExtensions.swift
//  Ahtau
//
//  Created by Mark Hamilton on 4/26/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

public extension Double {
    
    public var stringValue: String {
        
        return self.toString()
        
    }
    
    public func toString() -> String {
        
        return String(self)
        
    }
    
    public var intValue: Int {
        
        return self.toInt()
        
    }
    
    public func toInt() -> Int {
        
        return Int(self)
        
    }
    
    public func roundedByPlaces(places: Int) -> Double {
        
        let divisor = getDivisor(places)
        
        return round(self * divisor) / divisor
        
    }
    
    public mutating func roundByPlaces(places: Int) {
        
        self = self.roundedByPlaces(places)
        
    }
    
    public func ceiledByPlaces(places: Int) -> Double {
        
        let divisor = getDivisor(places)
        
        return round(self * divisor) / divisor
        
    }
    
}

public func getDivisor(places: Int) -> Double {
    
    return pow(10.0, Double(places))
    
}