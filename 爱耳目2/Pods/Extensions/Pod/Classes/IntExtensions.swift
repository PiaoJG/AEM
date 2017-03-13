//
//  IntExtensions.swift
//  Ahtau
//
//  Created by Mark Hamilton on 4/11/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

public extension Int {
    
    mutating func add(num: Int) {
        
        self.advancedBy(num)
        
    }
    
    mutating func postIncrement() -> Int {
        
        defer {
            
            self += 1
            
        }
        
        return self
        
    }
    
    mutating func postfix(increment: Int) -> Int {
        
        defer {
            
            self += increment
            
        }
        
        return self
        
    }
    
    mutating func postfixIncrement() -> Int {
        
        defer {
            
            self += 1
            
        }
        
        return self
        
    }
    
    func encodedOctets() -> [CUnsignedChar] {
        // Short form
        if self < 128 {
            return [CUnsignedChar(self)];
        }
        
        // Long form
        let i = (self / 256) + 1
        var len = self
        var result: [CUnsignedChar] = [CUnsignedChar(i + 0x80)]
        
        for _ in 0..<i {
            result.insert(CUnsignedChar(len & 0xFF), atIndex: 1)
            len = len >> 8
        }
        
        return result
    }
    
    init?(octetBytes: [CUnsignedChar], inout startIdx: Int) {
        if octetBytes[startIdx] < 128 {
            // Short form
            self.init(octetBytes[startIdx])
            startIdx += 1
        } else {
            // Long form
            let octets = Int(octetBytes[startIdx] - 128)
            
            if octets > octetBytes.count - startIdx {
                self.init(0)
                return nil
            }
            
            var result = UInt64(0)
            
            for j in 1...octets {
                result = (result << 8)
                result = result + UInt64(octetBytes[startIdx + j])
            }
            
            startIdx += 1 + octets
            self.init(result)
        }
    }
}