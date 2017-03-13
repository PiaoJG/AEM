//
//  StringExtensions.swift
//
//  Created by Mark Hamilton on 3/31/16.
//  Copyright © 2016 dryverless. (http://www.dryverless.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
// 

import Foundation

public extension String {

    subscript(index: Int) -> Character {

        return self[startIndex.advancedBy(index)]

    }

    subscript(range: Range<Int>) -> String {

        let char0 = startIndex.advancedBy(range.startIndex)

        let charN = startIndex.advancedBy(range.endIndex)

        return self[char0..<charN]

    }

    func length() -> Int {

        return self.characters.count

    }

    func toUnicodeArray() -> Array<UnicodeScalar> {

        let scalars = self.unicodeScalars

        return Array(scalars)

    }

}
