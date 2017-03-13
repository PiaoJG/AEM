# Extensions
Cocoapod of useful extensions written in Swift 2.x.

##Example Extension Usage

```swift
/// Value Type Extensions
var str = "Hello, playground"

str.subscript(range) // returns substring of range

str.subscript(index) // returns character at index

str.toUnicodeArray() // [72, 101, 108, 108, 111, 44, 32, 112, 108, 97, 121, 103, 114, 111, 117, 110, 100]

str.toUnicodeArray()[0].toChar() // "H"

str.toUnicodeArray().toString() // "Hello, playground"

str.length // 17 :: .length() in v0.0.1

var int: Int = 0

int.add(2) // 2

/// UITableView Extensions
var tableView: UITableView

tableView.animateData() // reloads data and animates load
tableView.animateData(1.0, delayOffset: 0.05, usingSpringWithDamping: 0.75, initialSpringVelocity: 0) // reloads data and animates

/// UIView Extensions
IBInspectable for cornerRadius

/// Delay Extension
var object: NSObject

object.delay(2) {
 // do something after 2 seconds
}

delay(2) {
 // do something after 2 seconds
}

/// Binary Search Extensions (all use throws)
func binarySearch(collection: [T], query: T) throws -> Bool
func binarySearchPrefix(collection: [String], query: String) throws -> Bool
func binarySearchFirst(collection: [String], query: String) throws -> Int
func binarySearchLast(collection: [String], query: String) throws -> Int

/// Array2D Struct
Array2D(columns: Int, rows: Int)
Array2D.subscript(column: Int, row: Int) -> Int
Array2D.columnCount()
Array2D.rowCount()

/// App Utils
AppDisplayName() -> String?
AppVersion() -> String?
AppBuildNumber() -> String?
AppBuildVersion() -> String?
DeviceVersion() -> String?
DetectScreenshot(completion: ()-> ())
IsDebug() -> Bool
IsRelease() -> Bool
IsSimulator() -> Bool
IsDevice() -> Bool

/// Device Feedback Utils
vibrate()

// NSBundle Extensions
.loadNib(name: String, owner: AnyObject!)
.loadNib<T>(name: String) -> T?

/// UIAlertController Extensions
.show() // Use RootViewController() to display alert
.showWithCompletion(completion: () -> Void) // Use RootViewController() to display alert with completion
alert.showWithCompletion() {
	
	// do something on completion

}
.setVisible // On set true it shows using RootViewController()

/// UIAlert Utils
showErrorAlert(description: String, error: NSError?, sender: UIViewController)
showErrorAlertUsingRoot(description: String, error: NSError?)

/// View Controller Utils
RootViewController() -> UIViewController? // Returns RootViewController in keyWindow
ScreenOrientation() -> UIInterfaceOrientation
HorizontalSizeClass() -> UIUserInterfaceSizeClass
VerticalSizeClass() -> UIUserInterfaceSizeClass
ScreenWidth() -> CGFloat
ScreenHeight() -> CGFloat
ScreenBounds() -> CGRect
StatusBarHeight() -> CGFloat
ScreenHeightMinusStatusBar() -> CGFloat
```

##CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 0.39.0+ is required to build Extensions 0.0.1+.

To integrate Extensions into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'Extensions', '~> 0.1'
```

Then, run the following command:

```bash
$ pod install
```

##Related Projects:

###Example Swift Apps by Mark Hamilton, Dryverless
Collection of example applications written in Swift / Objective-C for iOS 9.x (developed under 9.2.1 SDK - will be migrated to 9.3 when released)
######https://github.com/TheDarkCode/Example-Swift-Apps

##Support:

#####Send any questions or requests to: support@dryverless.com

## Contributing

  - 1) Fork this repository!
  - 2) Create your feature branch: ```git checkout -b Your-New-Feature```
  - 3) Commit your changes: ```git commit -am 'Adding some super awesome update'```
  - 4) Push to the branch: ```git push origin Your-New-Feature```
  - 5) Submit a pull request!

## License
Copyright (c) 2016 Mark Hamilton / dryverless (http://www.dryverless.com)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
