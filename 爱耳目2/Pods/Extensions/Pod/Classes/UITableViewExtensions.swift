//
//  UITableViewExtensions.swift
//
//  Created by Mark Hamilton on 3/25/16.
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
import UIKit

public extension UITableView {

    public func animateData() {

        self.reloadData()

        let cells = self.visibleCells

        let height: CGFloat = self.bounds.size.height

        for initialCell in cells {

            let cell: UITableViewCell = initialCell

            cell.transform = CGAffineTransformMakeTranslation(0, height)

        }

        var indexOfCell = 0

        for finalCell in cells {

            let cell: UITableViewCell = finalCell

            UIView.animateWithDuration(1.0,
                                       delay: 0.05 * Double(indexOfCell),
                                       usingSpringWithDamping: 0.75,
                                       initialSpringVelocity: 0,
                                       options: [],
                                       animations: {
                                        cell.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)

            indexOfCell += 1
        }

    }

    public func animateDataWithOptions(duration: NSTimeInterval, delayOffset: Double, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) {

        self.reloadData()

        let cells = self.visibleCells

        let height: CGFloat = self.bounds.size.height

        for initialCell in cells {

            let cell: UITableViewCell = initialCell

            cell.transform = CGAffineTransformMakeTranslation(0, height)

        }

        var indexOfCell = 0

        for finalCell in cells {

            let cell: UITableViewCell = finalCell

            UIView.animateWithDuration(duration,
                                       delay: delayOffset * Double(indexOfCell),
                                       usingSpringWithDamping: dampingRatio,
                                       initialSpringVelocity: velocity,
                                       options: [],
                                       animations: {
                                        cell.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)

            indexOfCell += 1
        }

    }

}
