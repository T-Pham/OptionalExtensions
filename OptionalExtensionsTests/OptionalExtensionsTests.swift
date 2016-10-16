//
//  OptionalExtensionsTests.swift
//  OptionalExtensionsTests
//
//  Created by Alan Skipp on 30/12/2015.
//  Copyright © 2015 Rui Peres. All rights reserved.
//

import XCTest
import OptionalExtensions

class OptionalExtensionsTests: XCTestCase {
    
    // MARK: - filter
    
    func test_filter_whenPredicateMatches_thenReturnsOptionalValue() {
        // given
        let number: Int? = 3
        
        // when
        let result = number.filter { $0 > 2 }
        
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_filter_whenPredicateDoesNotMatch_thenReturnsNil() {
        // given
        let number: Int? = 3
        
        // when
        let result = number.filter { $0 > 3 }
        
        // then
        XCTAssertNil(result)
    }
    
    
    // MARK: - mapNil
    
    func test_mapNil_whenInvokedWithNonNil_thenReturnsOriginalValue() {
        // given
        let number: Int? = 3
        
        // when
        let result = number.mapNil { 5 }
        
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_mapNil_whenInvokedWithNil_thenReturnsReplacedValue() {
        // given
        let nilledNumber: Int? = nil
        
        // when
        let result = nilledNumber.mapNil { 5 }
        
        // then
        XCTAssertEqual(result, 5)
    }
    
    // MARK: - flatMapNil
    
    func test_flatMapNil_whenInvokedWithNonNil_thenReturnsOriginalValue() {
        // given
        let number: Int? = 3
        
        // when
        let result = number.flatMapNil { .some(2) }
        
        // then
        XCTAssertEqual(result, .some(3))
    }
    
    func test_flatMapNil_whenInvokedWithNil_thenReturnsReplacedValue() {
        // given
        let nilledNumber: Int? = nil
        
        // when
        let result = nilledNumber.flatMapNil { .some(2) }
        
        // then
        XCTAssertEqual(result, .some(2))
    }

    // MARK: - then
    
    func test_then_whenInvokedOnNonNilValue_thenOperationIsInvoked() {
        // given
        var testInt = 0
        let nonNilledNumber: Int? = 3
        
        // when
        nonNilledNumber.then { _ in testInt = 2 }
        
        // then
        XCTAssertEqual(testInt, 2)
    }
    
    func test_then_whenInvokedOnNilValue_thenOperationIsNotInvoked() {
        // given
        var testInt = 0
        let nilledNumber: Int? = nil
        
        // when
        nilledNumber.then { _ in testInt = 2 }
        
        // then
        XCTAssertEqual(testInt, 0)
    }
    
    // MARK: - onSome
    
    func test_onSome_whenInvokedOnNonNilValue_thenOperationIsInvoked_andOperationResultIsReturned() {
        // given
        var testInt = 0
        let nonNilledNumber: Int? = 3
        
        // when
        let result = nonNilledNumber.onSome { _ in testInt = 2 }
        
        // then
        XCTAssertEqual(testInt, 2)
        XCTAssertEqual(result, 3)
    }
    
    func test_onSome_whenInvokedOnNilValue_thenOperationIsNotInvoked_andNilIsReturned() {
        // given
        var testInt = 0
        let nilledNumber: Int? = nil
        
        // when
        let result = nilledNumber.onSome { _ in testInt = 2 }
        
        // then
        XCTAssertEqual(testInt, 0)
        XCTAssertNil(result)
    }
    
    // MARK: - onNone
    
    func test_onNone_whenInvokedOnNonNilValue_thenOperationIsNotInvoked_andOperationResultIsReturned() {
        // given
        var testInt = 0
        let nonNilledNumber: Int? = 3
        
        // when
        let result = nonNilledNumber.onNone { _ in testInt = 2 }
        
        // then
        XCTAssertEqual(testInt, 0)
        XCTAssertEqual(result, 3)
    }
    
    func test_onNone_whenInvokedOnNilValue_thenOperationIsInvoked_andNilIsReturned() {
        // given
        var testInt = 0
        let nilledNumber: Int? = nil
        
        // when
        let result = nilledNumber.onNone { _ in testInt = 2 }
        
        // then
        XCTAssertEqual(testInt, 2)
        XCTAssertNil(result)
    }
    
    // MARK: - isSome
    
    func test_isSome_whenInvokedOnNonNilValue_thenReturnsTrue() {
        // given
        let nonNilledNumber: Int? = 3
        
        // then
        XCTAssertTrue(nonNilledNumber.isSome)
    }
    
    func test_isSome_whenInvokedOnNilValue_thenReturnsFalse() {
        // given
        let nilledNumber: Int? = nil
        
        // then
        XCTAssertFalse(nilledNumber.isSome)
    }
    
    // MARK: - isNone
    
    func test_isNone_whenInvokedOnNonNilValue_thenReturnsFalse() {
        // given
        let nonNilledNumber: Int? = 3
        
        // then
        XCTAssertFalse(nonNilledNumber.isNone)
    }
    
    func test_isNone_whenInvokedOnNilValue_thenReturnsTrue() {
        // given
        let nilledNumber: Int? = nil
        
        // then
        XCTAssertTrue(nilledNumber.isNone)
    }
    
    // MARK: - maybe
    
    func test_maybe_whenInvokedOnNonNilValue_thenExecutesOperationAndReturnsItsResult() {
        // given
        let nonNilledNumber: Int? = 1
        
        // when
        let result = nonNilledNumber.maybe(100) { $0 + 50 }
        
        // then
        XCTAssertEqual(result, 51)
    }
    
    func test_maybe_whenInvokedOnNilValue_thenDoesNotExecuteOperationAndReturnsDefaultValue() {
        // given
        let nilledNumber: Int? = nil
        
        // when
        let result = nilledNumber.maybe(100) { $0 + 50 }
        
        // then
        XCTAssertEqual(result, 100)
    }

    // MARK: - flatten

    func test_flatten_whenInvokedOnNilValue() {
        // given
        let nilledNumber: Int? = nil

        // when
        let result = nilledNumber.flatten()

        // then
        XCTAssertNil(result)
    }

    func test_flatten_whenInvokedOnNestedNilValue() {
        // given
        let nestedNilledNumber: Int??? = nil

        // when
        let result = nestedNilledNumber.flatten()

        // then
        XCTAssertNil(result)
    }

    func test_flatten_whenInvokedOnNonNilValue() {
        // given
        let nonNilledNumber: Int? = 1

        // when
        let result = nonNilledNumber.flatten()

        // then
        XCTAssertEqual(result as? Int, 1)
    }

    func test_flatten_whenInvokedOnNestedNonNilValue() {
        // given
        let nestedNonNilledNumber: Int??? = 1

        // when
        let result = nestedNonNilledNumber.flatten()

        // then
        XCTAssertEqual(result as? Int, 1)
    }
}
