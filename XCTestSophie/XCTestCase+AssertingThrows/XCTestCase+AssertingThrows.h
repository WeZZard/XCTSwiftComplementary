//
//  XCTestCase+AssertingThrows.h
//
//
//  Created by WeZZard on 29/05/2017.
//
//

#import <XCTest/XCTest.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXTERN_INLINE void _XCTSAssertThrows(
    XCTestCase * self,
    void (NS_NOESCAPE ^ block)(void),
    NSString * message,
    NSString * file,
    NSUInteger line
) NS_REFINED_FOR_SWIFT;

FOUNDATION_EXTERN_INLINE void _XCTSAssertThrowsSpecific(
    XCTestCase * self,
    void (NS_NOESCAPE ^ block)(void),
    Class exceptionClass,
    NSString * message,
    NSString * file,
    NSUInteger line
) NS_REFINED_FOR_SWIFT;

FOUNDATION_EXTERN_INLINE void _XCTSAssertThrowsSpecificNamed(
    XCTestCase * self,
    void (NS_NOESCAPE ^ block)(void),
    NSString * exceptionName,
    NSString * message,
    NSString * file,
    NSUInteger line
) NS_REFINED_FOR_SWIFT;

NS_ASSUME_NONNULL_END
