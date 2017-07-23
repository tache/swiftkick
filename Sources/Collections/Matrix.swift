//
//  Matrix.swift
//  SwiftKick
//
//  Created by Jason Dudash on 7/6/17.
//  Copyright © 2017 Jason Dudash. All rights reserved.
//

#if !(SK_IGNORE_MATRIX)
    
import Foundation

/** 2D array based on this:
 https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Subscripts.html
 */
struct Matrix<T> {
    let rows: Int, columns: Int
    var grid: [T]
    
    //--------------------------------------------------------------------------
    
    init(rows: Int, columns: Int, defaultElement:T) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: defaultElement, count: rows * columns)  // this uses the same T for all values
    }
    
    //--------------------------------------------------------------------------
    
    init(rows: Int, columns: Int, elementCreator: @autoclosure () -> T) {
        self.rows = rows
        self.columns = columns
        grid = (0 ..< rows * columns).map { _ in elementCreator() } // this creates T so every value is unique
    }
    
    //--------------------------------------------------------------------------
    
    fileprivate func indexIsValidForRow(_ row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    //--------------------------------------------------------------------------
    
    subscript(row: Int, column: Int) -> T {
        get {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
    
    //--------------------------------------------------------------------------
    
    func rowCount() -> Int {
        return self.rows
    }
    
    //--------------------------------------------------------------------------
    
    func columnCount() -> Int {
        return self.columns
    }
}

#endif // SK_IGNORE_MATRIX
