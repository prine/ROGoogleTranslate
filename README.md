# ROGoogleTranslate
[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
             )](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat
             )](https://developer.apple.com/swift)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat
            )](http://mit-license.org)
[![Issues](https://img.shields.io/github/issues/prine/ROGoogleTranslate.svg?style=flat
           )](https://github.com/prine/ROGoogleTranslate/issues)

Provides a Helper class to simplify the usage of the Google Translate API via Swift.

## Installation

ROGoogleTranslate is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ROGoogleTranslate"
```

## How to use
Create an instance of the `ROGoolgeTranslate` class and store the API key from the Google Translate API. To do a translation call the `translate` method and pass the `ROGoogleTranslateParams` (sourceLanguage, targetLanguage, textToTranslate). You will asynchronously retrieve the translated text in the `callback` object.

```Swift
let translator = ROGoogleTranslate()
translator.apiKey = "" // Add your API Key here

var params = ROGoogleTranslateParams()
params.source = "en"
params.target = "de"
params.text = "Here you can add your sentence you want to be translated"

translator.translate(params: params) { (result) in
    print("Translation: \(result)")
}
```

## Requirements

- iOS 9.0+ / macOS 10.11+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 8.0+
- Swift 3.0+

## License

```
The MIT License (MIT)

Copyright (c) 2016 Robin Oster (http://prine.ch)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

## Author

Robin Oster, work@prine.ch
