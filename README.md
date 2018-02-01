# MetaSerialization
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

meta-serialization is a framework to simplify writing new serialisation libraries for the swift standard library environment (Encodable, Decodable, etc.)
It's aim is to let anyone create a serialization library that works with the swift serialization framework by nearly just writing the real serialization code.

This framework is **untested**!
Any help is welcome.

## What it does
meta-serialization provides a layer inbetween your serialization framework and the swift standard library interface 
(mainly Encoder and Decoder) and implements most of the overhead Encoder and Decoder require.
### What it does in many words
meta-serialization provides a MetaEncoder and MetaDecoder, that depend on a so-called Translator. 

MetaDecoder and MetaEncoder create a representation of the serialized data in a meta format. 
This format is created in a way, that in the end the *meta tree* (as I call the in-between format) will only contain values, 
that *are natively supported by your framework* or in other words that you can encode directly. 
This enables you to serialize any swift class or struct or enum you write, 
plus any array, dictionary, tuple, Int, String, and so on to an external (I call it raw) representation that only supports, 
say, Numbers, String and some kind of Dictionarys and Arrays by mainly writing the code to convert a swift Int to your representation of a number, a swift String to your representation of a String, a swift Array of exclusively your supported types (Number, String, Dictionary, Array in this example) to your representation of a *unkeyed container* or Array and  a swift Dictionary (of exclusively your supported types) to your representation of a *keyed container* or Dictionary (or Map).

## Installation
Install MetaSerialization via Cartage, CocoaPods or swift package manager.
### Carthage
Add the following line to your projects Cartfile:
```ogdl
github "cherrywoods/swift-meta-serialization"
```
For more information about cartage and it's usage, please consult [carthage's github repository](https://github.com/Carthage/Carthage "https://github.com/Carthage/Carthage").
### CocoaPods
Add the following line to your Podfile:
```ruby
pod 'MetaSerialization', '~> 0.1.0'
```
For more information about Cocoapods, consult [cocoapods.org](https://cocoapods.org)
### Swift Package Manager
Insert the following code into your Package.swift file, into the dependencies array of your Package.
```swift
.package(url: "https://github.com/cherrywoods/swift-meta-serialization.git", from: "0.0.4"),
```
Please note, that I never tested whether this will work, please open a pull request if it doesn't. Carthage should work.

For more information about the swift package manager, visit [https://swift.org/package-manager/](https://swift.org/package-manager/ "https://swift.org/package-manager/").

## Usage
You can find a example [here](https://github.com/cherrywoods/swift-meta-serialization/blob/master/Examples/BasicUsage.playground/Contents.swift). The example presents a verry simple and basic way to use MetaSerialization, that is also the shortest way to use this framework. Clone this repository, if you'd like to play around with it.

[This repository](https://github.com/cherrywoods/meta-serialization-example) contains a complete example implementation for a self invented useless serialization format. You may use this example as a blueprint for most other implementations.

Finally [swift-msgpack-serialization](https://github.com/cherrywoods/swift-msgpack-serialization) is a real implementation for the [msgpack serialization format](msgpack.org), that deploys further features of MetaSerialization.
## Limitation
MetaSerialization can only do it's work properly, if you do not use the function encode(to: ) of the Encodable protocol directly in your implementation of it. Use the encode methods of the (Un)Keyed/SingleValueEncodingContainers instead. 
## Further documentation
Please consult the documentation tab in github
## Spelling and grammar errors
The project documentation and sourcecode will contain spelling and grammar mistakes. If they obscure the meaning, please open an issue.
## What could be done
 - [ ] Include more tests
 - [ ] Check the decoding and encoding code
 - [ ] Write more documentation
