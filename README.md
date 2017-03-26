# Viscosity
![swift version](https://img.shields.io/badge/Language-Swift3-blue.svg)
[![travis-ci](https://travis-ci.org/Wzxhaha/Viscosity.svg?branch=master)](https://travis-ci.org/Wzxhaha/Viscosity)
[![Platform](https://img.shields.io/cocoapods/p/Viscosity.svg?style=flat)](https://github.com/Wzxhaha/Viscosity)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/Viscosity.svg)](https://cocoapods.org/pods/Viscosity)
<br/>
Autolayout DSL for iOS <br/>
**Simple** and **Powerful**.

## Usage

### Normal

```swift
 view.vis_makeConstraints { (make) in
   make.left == view.vis_right *~ 2 +~ 100 ~~ UILayoutPriorityDefaultLow ~| true
 }
```

```swift
 view.vis_makeConstraints { (make) in
   make.size <= 100 ~~ UILayoutPriorityDefaultLow
 }
```

```swift
 view.vis_makeConstraints { (make) in
   make[.left, .right, .top] == view
 }
```


### Update

```swift
 view.vis_updateConstraints { (make) in }
```

### Remake
```swift
 view.vis_remakeConstraints { (make) in }
```

## Operator

| Operator | Position | Description |
| ---------|:--------:| -----------:|
| == | mid | equal |
| >= | mid | greaterThanOrEqual |
| <= | mid | lessThanOrEqual |
| +~ | mid | offset |
| *~ | mid | multiplier |
| ~~ | mid | priority |
| ~\| | mid | isActive |


## Installation

### Swift Package Manager

Package.swift
```swift
let package = Package(
    name: "XXX",
    dependencies: [
        .Package(url: "https://github.com/Wzxhaha/Viscosity", majorVersion: 2)
    ]
)
```

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Viscosity into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target '<Your Target Name>' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'Viscosity', '~> 2.0'

end
```

Then, run the following command:

```bash
$ pod install
```

## License
Viscosity is released under the MIT license. See LICENSE for details.
