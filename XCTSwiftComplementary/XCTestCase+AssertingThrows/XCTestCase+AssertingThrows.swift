//
//  XCTestCase+AssertingThrows.swift
//
//
//  Created by WeZZard on 29/05/2017.
//
//

import Foundation
import XCTest

extension XCTestCase {
    @inline(__always)
    public func XCTAssertThrows<T>(
        _ expression: @autoclosure () -> T,
        message: String = "",
        _ file: String = #file,
        _ line: UInt = #line
        )
    {
        ___XCTSAssertThrows(self, {_ = expression()}, message, file, line)
    }
    
    @inline(__always)
    public func XCTAssertThrowsSpecific<T, E: NSException>(
        _ expression: @autoclosure () -> T,
        exception: E.Type,
        message: String = "",
        _ file: String = #file,
        _ line: UInt = #line
        )
    {
        ___XCTSAssertThrowsSpecific(self, {_ = expression()}, E.self, message, file, line)
    }
    
    @inline(__always)
    public func XCTAssertThrowsSpecificNamed<T>(
        _ expression: @autoclosure () -> T,
        exceptionName: String,
        message: String = "",
        _ file: String = #file,
        _ line: UInt = #line
        )
    {
        ___XCTSAssertThrowsSpecificNamed(self, {_ = expression()}, exceptionName, message, file, line)
    }
}
