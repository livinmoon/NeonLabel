# NeonLabel

[![CI Status](https://img.shields.io/travis/122723478/NeonLabel.svg?style=flat)](https://travis-ci.org/livinmoon/NeonLabel)
[![Version](https://img.shields.io/cocoapods/v/NeonLabel.svg?style=flat)](https://cocoapods.org/pods/NeonLabel)
[![License](https://img.shields.io/cocoapods/l/NeonLabel.svg?style=flat)](https://cocoapods.org/pods/NeonLabel)
[![Platform](https://img.shields.io/cocoapods/p/NeonLabel.svg?style=flat)](https://cocoapods.org/pods/NeonLabel)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

```objc
#import <NeonLabel/NeonLabel.h>
#import <Masonry/Masonry.h>

NeonLabel *label = [[NeonLabel alloc] init];
label.text = @"Hello World!";
[self.view addSubview:label];
[label mas_makeConstraints:^(MASConstraintMaker *make) { 
   make.edges.equalTo(self.view); 
}];
```

## Installation

NeonLabel is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NeonLabel'
```

## License

NeonLabel is available under the MIT license. See the LICENSE file for more info.
