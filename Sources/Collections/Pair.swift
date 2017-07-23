//
//  Pair.swift
//  SwiftKick
//
//  Created by Jason Dudash on 7/6/17.
//  Copyright © 2017 Jason Dudash. All rights reserved.
//

#if !(SK_IGNORE_PAIR)

import Foundation

// Usage:
//let pair = Pair(values:("C","D"))
//var pairMap = Dictionary<Pair<String,String>,String>()
//pairMap[pair] = "A"

/* Pair Class, thanks to:
 http://stackoverflow.com/questions/24131323/in-swift-can-i-use-a-tuple-as-the-key-in-a-dictionary
 */
struct Pair<T:Hashable,U:Hashable> : Hashable {
    let values : (T, U)
    
    var hashValue : Int {
        get {
            let (a,b) = values
            return a.hashValue &* 31 &+ b.hashValue  // a.hash * 31 + b.hash (with overflow protection)
        }
    }
}

// comparison function for conforming to Equatable protocol
func ==<T:Hashable,U:Hashable>(lhs: Pair<T,U>, rhs: Pair<T,U>) -> Bool {
    return lhs.values == rhs.values
}

#endif // SK_IGNORE_PAIR
