//
//  BinarySearchExtensions.swift
//
//  Created by Mark Hamilton on 3/26/16.
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

public enum CalcError: ErrorType {

    case InvalidAverage

    case InvalidMiddleValue
}

public func binarySearch< T : Comparable >(collection: [T], query: T) throws -> Bool {

    var leftCount: Int = 0
    var rightCount: Int = collection.count - 1

    while( leftCount <= rightCount ) {

        guard let middleValue: Int = (( leftCount + rightCount ) / 2) else {

            throw CalcError.InvalidAverage

        }

        guard let estimatedValue: T = collection[middleValue] else {

            throw CalcError.InvalidMiddleValue

        }

        if (estimatedValue == query) {

            return true

        }

        if (estimatedValue < query) {

            leftCount = middleValue + 1

        }

        if (estimatedValue > query) {

            rightCount = middleValue - 1

        }

    }

    return false

}

public func binarySearchPrefix(collection: [String], query: String) throws -> Bool {

    var leftCount: Int = 0
    var rightCount: Int = collection.count - 1

    while( leftCount <= rightCount ) {

        guard let middleValue: Int = (( leftCount + rightCount ) / 2) else {

            throw CalcError.InvalidAverage

        }

        guard let estimatedValue: String = collection[middleValue] else {

            throw CalcError.InvalidMiddleValue

        }

        if (estimatedValue.hasPrefix(query)) {

            return true

        }

        if (estimatedValue < query) {

            leftCount = middleValue + 1

        }

        if (estimatedValue > query) {

            rightCount = middleValue - 1

        }

    }

    return false

}

public func binarySearchFirst(collection: [String], query: String) throws -> Int {

    var leftCount: Int = 0
    var rightCount: Int = collection.count - 1

    while( leftCount <= rightCount ) {

        guard let middleValue: Int = (( leftCount + rightCount ) / 2) else {

            throw CalcError.InvalidAverage

        }

        guard let estimatedValue: String = collection[middleValue] else {

            throw CalcError.InvalidMiddleValue

        }

        if (estimatedValue.hasPrefix(query) && leftCount == rightCount) {

            return leftCount

        }

        if estimatedValue.hasPrefix(query) {

            if middleValue > 0 && !collection[middleValue - 1].hasPrefix(query) {

                return middleValue

            }

            rightCount = middleValue - 1

        } else if (estimatedValue < query) {

            leftCount = middleValue + 1

        } else if (estimatedValue > query) {

            rightCount = middleValue - 1

        }

    }

    return -1

}

public func binarySearchLast(collection: [String], query: String) throws -> Int {

    var leftCount: Int = 0
    var rightCount: Int = collection.count - 1

    while( leftCount <= rightCount ) {

        guard let middleValue: Int = (( leftCount + rightCount ) / 2) else {

            throw CalcError.InvalidAverage

        }

        guard let estimatedValue: String = collection[middleValue] else {

            throw CalcError.InvalidMiddleValue

        }

        if (estimatedValue.hasPrefix(query) && leftCount == rightCount) {

            return leftCount

        }

        if estimatedValue.hasPrefix(query) {

            if middleValue < collection.count - 1 && !collection[middleValue + 1].hasPrefix(query) {

                return middleValue

            }

            leftCount = middleValue + 1

        } else if (estimatedValue < query) {

            leftCount = middleValue + 1

        } else if (estimatedValue > query) {

            rightCount = middleValue - 1

        }

    }

    return -1

}
