
# SwiftKick
Some classes and functions for the Swift programming language.  Ideas are welcome and keep checking back for updates.

## Simple to Use with CocoaPods

Add the cocoapod for swiftkick to your Podfile with:

```pod "SwiftKick"```

or to use the latest:

```pod "SwiftKick", :git => 'https://github.com/dudash/swiftkick.git'```

Import the library into your xcode project .swift files:

```import SwiftKick```

You can also individually include just parts of SwiftKick you want using the SwiftKick groups.  That would look like this:

```pod "SwiftKick/Logger"```

The list of available groups are:
* Collections -  The SwiftKick collection classes
* Extensions - All the extensions
* NumberExtensions - Just the number extensions
* StringExtensions - Just the String extensions
* UIExtensions - Just the UI extensions
* PreferenceExtensions - Just the Foundation/Preferences extensions
* Logger - The SwiftKick POWERFUL Logger classes 

----

## API Classes
 
### Collections
Additional classes related to collections.  Current list with examples is below.

 #### Pair
 ```
 let pair = Pair(values:("C","D"))
 var pairMap = Dictionary<Pair<String,String>,String>()
 pairMap[pair] = "A"
 ```
 
 #### Matrix
 ```
 let grid:Matrix<Slot> = Matrix(rows: rows, columns: cols, elementCreator: Slot())
 
 // top row && bottom row
 for index in 0...cols-1 {
 grid[0, index].edgeType = Slot.EdgeType.bottom_EDGE
 grid[rows-1, index].edgeType = Slot.EdgeType.top_EDGE
 }
 
 // left edge && right edge
 for index in 0...rows-1 {
 grid[index, 0].edgeType = Slot.EdgeType.left_EDGE
 grid[index, cols-1].edgeType = Slot.EdgeType.right_EDGE
 }
 
 // 4 corners
 grid[0, 0].edgeType = Slot.EdgeType.bottom_LEFT_EDGE
 grid[rows-1, 0].edgeType = Slot.EdgeType.top_LEFT_EDGE
 grid[0, cols-1].edgeType = Slot.EdgeType.bottom_RIGHT_EDGE
 grid[rows-1, cols-1].edgeType = Slot.EdgeType.top_RIGHT_EDGE
 ```
 
### Logger
Create a logger object with desired output level and verbosity (recommend to do this in a Globals.swift file):

```let log = SwiftKick.Logger(level: Logger.LoggerLevel.TRACE, verbosity:Logger.LoggerVerbosity.DEFAULT)```

Add log everywhere in your code:

```log.debug("Properties are = \(props)")```

Available log commands are:
`always`, `trace`, `debug`, `info`, `warn`, `error`, `fatal`

Available verbosity values are defined as:

```
public enum LoggerVerbosity
{
	case DEFAULT
	case MAXIMUM
	case VERBOSE
	case MINIMUM
}
```

Available level values are defined as:

```
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
```

## Swift Class Extensions
If you want to individually include just the extensions you want, you can do that because SwiftKick (including extensions) is divided into groups.
e.g.  `pod 'SwiftKick/StringExtensions'`

You can also turn any class within an extension group off by defining a custom flag of the form `SK_IGNORE_CLASSNAME`.  [Read more about that here][1].

### NumberExtensions

Adds ease of access to number conversion 
Below are the list of extensions for each type:

#### Int
* `cgFloatValue`
* `degreesToRadians`
* `radiansToDegrees`
* `random(min,max)`

#### Double
* `cgFloatValue`
* `degreesToRadians`
* `radiansToDegrees`
* `random(min,max)`

#### Float
* `cgFloatValue`
* `degreesToRadians`
* `radiansToDegrees`
* `doubleValue`
* `random(min,max)`

#### CGFloat
* `degreesToRadians`
* `radiansToDegrees`
* `doubleValue`
* `floatValue`
* `random(min,max)`   

### StringExtensions
Encode string for building a URL:

```let url = myString.encodeForURL()```

Encode string as base64 string:

```let myBase64String = myString.toBase64()```

Decode string from base64 string:

```let myString = myBase64String.fromBase64()```


### UIExtensions
#### UIColor
Get the CoreImage Color

```let myColor = coreImageColor```

Adds the capability to initialize from HEX values

```let myColor = UIColor(fromHex:0x00000c)```

Get color components as a HEX Hash - i.e. #C2AC2A

```let myHEXHash = UIColor.hexDescription(UIColor.red)```

Get a random color

```let myRandomColor = UIColor.getRandomColor()```

Get [Flat UI Colors](http://flatuicolors.com) colors by name

```let myFlatColor = UIColor.turquoiseColor()```

Get a color's Hue, Saturation, Brightness, Alpha components

```
let myHBSA = UIColor.getHSBAComponents(UIColor.alizarinColor())
let myHue = myHBSA()?.hue
let mySaturation = myHBSA()?.saturation
let myBrightness = myHBSA()?.brightness
let myAlpha = myHBSA()?.alpha
```

#### UIImage+Tint

Add the capability to tint an image with a UIColor

```let tintedImage = myImage.tint(UIColor.blueColor(), blendMode: CGBlendMode.Normal)```


#### UIView+Gradient

Add the capability to create a linear gradient view from a set of colors similar to CSS.  [See here][2]

```let view = UIView()```

```let colorStop1 = ColorWithStop(UIColor(fromHex:0x20202c),0)```

```let colorStop2 = ColorWithStop(UIColor(fromHex:0x515175),100)```

```view.addLinearGradientLayer(colorStop1, colorStop2)```

### PreferencesExtensions
#### UserDefaults+FirstLaunch

Check to see if this is the first launch of the app.  Stores a key in UserDefaults.


[1]: http://stackoverflow.com/questions/24111854/in-absence-of-preprocessor-macros-is-there-a-way-to-define-practical-scheme-spe/24112024#24112024
[2]: http://www.w3schools.com/css/css3_gradients.asp



-----

## Notes on Xcode 8
With Xcode 8 backwards compatability can be a challenge.  SwiftKick now supports Swift 2.3 and Swift 3.0 and this will be in separate release versions.  Swift 2.3 will be maintained in the 0.x branches and Swift 3.0 will bump up the MAJOR number to 1.x.  Keep in mind that Swift 2.3 and Swift 3.0 pods don't mix.

To use this pod with Swift 2.3 include with:

```pod "SwiftKick", "~> 0.1.0"```

Also at the end of your Podfile add the following code:

```
post_install do |installer|
	installer.pods_project.targets.each do |target|
		target.build_configurations.each do |config|
			config.build_settings['SWIFT_VERSION'] = '2.3'
        end
	end
end
```

Also, make sure to set the `Use Legacy Swift` flag in your project's build settings"


To use this pod with Swift 3.0 include with:

```pod "SwiftKick", "~> 1.0.0"```
