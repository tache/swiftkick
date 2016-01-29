# SwiftKick
Some classes and functions for the Swift programming language.  Ideas are welcome and keep checking back for updates.

## Simple to Use with CocoaPods
Add the cocoapod for swiftkick to your Podfile with:
> pod "SwiftKick"

or to use the latest:
 > pod "SwiftKick", :git => 'https://github.com/dudash/swiftkick.git'

Import the library into your xcode project .swift files:
 > import SwiftKick

## API Classes
### Logger
Create a logger object with desired output level and verbosity (recommend to do this in a Globals.swift file):
 > let log = SwiftKick.Logger(level: Logger.LoggerLevel.TRACE, verbosity:Logger.LoggerVerbosity.DEFAULT)

Add log everywhere in your code:
 > log.debug("Properties are = \\(props)")

Available log commands are:
trace, debug, info, warn, error, fatal

Available verbosity values are defined as:

    public enum LoggerVerbosity
    {
        case DEFAULT
        case MAXIMUM
        case VERBOSE
        case MINIMUM
    }

Available level values are defined as:

    public enum LoggerLevel: Int
    {
        case ALL = 0
        case TRACE = 10
        case DEBUG = 20
        case INFO = 30
        case WARN = 40
        case ERROR = 50
        case FATAL = 60
    }

## Swift Class Extensions
You can turn any class extension off by defining a custom flag of the form SK_IGNORE_CLASSNAME.  [Read more about that here][1]

### String
Encode string for building a URL:
 > let url = myString.encodeForURL()

Encode string as base64 string:
 > let myBase64String = myString.toBase64()

Decode string from base64 string:
 > let myString = myBase64String.fromBase64()

### UIColor+Hex
Adds the capability to initialize from HEX values
> let myColor = UIColor(fromHex:0x00000c)

### UIImage+Tint
Add the capability to tint an image with a UIColor
> let tintedImage = myImage.tint(UIColor.blueColor(), blendMode: CGBlendMode.Normal)

### UIView+Gradient
Add the capability to create a linear gradient view from a set of colors similar to CSS.  [See here][2]
> let view = UIView()
> let colorStop1 = ColorWithStop(UIColor(fromHex:0x20202c),0)
> let colorStop2 = ColorWithStop(UIColor(fromHex:0x515175),100)
> view.addLinearGradientLayer(colorStop1, colorStop2)



[1]: http://stackoverflow.com/questions/24111854/in-absence-of-preprocessor-macros-is-there-a-way-to-define-practical-scheme-spe/24112024#24112024
[2]: http://www.w3schools.com/css/css3_gradients.asp



