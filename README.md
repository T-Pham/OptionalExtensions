# OptionalExtensions

<a href="https://travis-ci.org/RuiAAPeres/OptionalExtensions"><img src="https://travis-ci.org/RuiAAPeres/OptionalExtensions.svg?branch=master"></a>
<a href="https://github.com/Carthage/Carthage"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a>
[![CocoaPods](https://img.shields.io/cocoapods/v/OptionalExtensions.svg)](https://cocoapods.org/)
[![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![License MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg?style=flat)](https://opensource.org/licenses/MIT)
![](https://camo.githubusercontent.com/410f44c161ebf367eacb1fcce9121e336e211bc6/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f506c6174666f726d2d696f732532302537432532306f737825323025374325323077617463686f7325323025374325323074766f732d6c69676874677265792e7376673f7374796c653d666c6174)

Why?
----

Swift's Optional is pretty awesome, but it can always get better. This repository is an humble attempt to add some utility methods to it.

Operators
--------

* [filter](https://github.com/RuiAAPeres/OptionalExtensions#filter-wrapped---bool---optionalwrapped)
* [mapNil](https://github.com/RuiAAPeres/OptionalExtensions#mapnil-void---wrapped---optionalwrapped)
* [flatMapNil](https://github.com/RuiAAPeres/OptionalExtensions#flatmapnil-void---optionalwrapped---optionalwrapped)
* [then](https://github.com/RuiAAPeres/OptionalExtensions#then-wrapped---void---void-similar-to-ts-foreach)
* [maybe](https://github.com/RuiAAPeres/OptionalExtensions#maybe-u---wrapped---u---u-similar-to-haskells-maybe)
* [onSome](https://github.com/RuiAAPeres/OptionalExtensions#onsome-wrapped---void---optionalwrapped-injects-a-side-effect-in-the-some-branch)
* [onNone](https://github.com/RuiAAPeres/OptionalExtensions#onnone-void---void---optionalwrapped-injects-a-side-effect-in-the-none-branch)
* [isSome](https://github.com/RuiAAPeres/OptionalExtensions#issome-bool)
* [isNone](https://github.com/RuiAAPeres/OptionalExtensions#isnone-bool)
* [flatten](https://github.com/RuiAAPeres/OptionalExtensions#flatten-void---any)

####`filter: (Wrapped -> Bool) -> Optional<Wrapped>`

```swift
let number: Int? = 3

let biggerThan2 = number.filter { $0 > 2 } // .Some(3)

let biggerThan3 = number.filter { $0 > 3 } // .None
```

####`mapNil: (Void -> Wrapped) -> Optional<Wrapped>`

```swift
let number: Int? = 3
number.mapNil { 2 } // .Some(3)

let nilledNumber: Int? = nil
nilledNumber.mapNil { 2 } // .Some(2)
```

####`flatMapNil: (Void -> Optional<Wrapped>) -> Optional<Wrapped>`

```swift
let number: Int? = 3
number.flatMapNil { .Some(2) } // .Some(3)

let nilledNumber: Int? = nil
nilledNumber.flatMapNil { .Some(2) } // .Some(2)
```

####`then: (Wrapped -> Void) -> Void` (similar to `[T]`'s `forEach`)

```swift
let number: Int? = 3
number.then { print($0) } // prints "3"

let nilledNumber: Int? = nil
nilledNumber.then { print($0) } // print won't be called
```

####`maybe: U -> (Wrapped -> U) -> U` (similar to Haskell's `maybe`)

```swift
let number: Int? = 3
number.maybe(100) { $0 + 1 } // 4

let nilledNumber: Int? = nil
nilledNumber.maybe(100) { $0 + 1 } // 100
```

####`onSome: (Wrapped -> Void) -> Optional<Wrapped>` (injects a side effect in the `.Some` branch)

```swift
let number: Int? = 3
let sameNumber = number.onSome { print($0) } // prints "3" & returns .Some(3)

let nilledNumber: Int? = nil
let sameNilledNumber = nilledNumber.onSome { print($0) } // .None
```

####`onNone: (Void -> Void) -> Optional<Wrapped>` (injects a side effect in the `.None` branch)

```swift
let number: Int? = 3
let sameNumber = number.onNone { print("Hello World") } // .Some(3)

let nilledNumber: Int? = nil
let sameNilledNumber = nilledNumber.onNone { print("Hello World") } // prints "Hello World" & returns .None
```

####`isSome: Bool`

```swift
let number: Int? = 3
let isSome = number.isSome // true

let nilledNumber: Int? = nil
let isSome = nilledNumber.isSome // false
```

####`isNone: Bool`

```swift
let number: Int? = 3
let isSome = number.isNone // false

let nilledNumber: Int? = nil
let isSome = nilledNumber.isNone // true
```

####`flatten: Void -> Any?`

```swift
let number: Int??? = 3
number.flatten() // .Some(3)

let nilledNumber: Int??? = nil
nilledNumber.flatten() // .None
```

Setup
-----

**Carthage:**

```
github "RuiAAPeres/OptionalExtensions"
```

**CocoaPods:**

```
pod "OptionalExtensions"
```

**Manually:**

Grab the [OptionalExtensions.swift](https://github.com/RuiAAPeres/OptionalExtensions/blob/master/OptionalExtensions/Source/OptionalExtensions.swift) file and drop it in your project. 


Contributing
-----------

We will gladly accept Pull Requests with new methods or improving the ones that already exist. Documentation, or tests, are always welcome as well. ❤️

License
-------

OptionalExtensions is licensed under the MIT License, Version 2.0. [View the license file](LICENSE)

Copyright (c) 2015 Rui Peres
