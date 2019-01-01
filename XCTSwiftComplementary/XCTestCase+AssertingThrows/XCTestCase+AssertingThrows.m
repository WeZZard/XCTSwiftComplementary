//
//  XCTestCase+AssertingThrows.m
//
//
//  Created by WeZZard on 29/05/2017.
//
//

#import "XCTestCase+AssertingThrows.h"

void _XCTSAssertThrows(XCTestCase * self, void (^ block)(void), NSString * message, NSString * file, NSUInteger line) {
    BOOL didThrow = NO;
    @try {
        block();
    } @catch (...) {
        didThrow = YES;
    }
    
    if (!didThrow) {
        _XCTFailureHandler(self, YES, file.UTF8String, line, _XCTFailureDescription(_XCTAssertion_Fail, 0), @"" @"No throw: %@", message);
    }
}

void _XCTSAssertThrowsSpecific(XCTestCase * self, void (^ expression)(void), Class exceptionClass, NSString * message, NSString * file, NSUInteger line) {
    BOOL didThrow = NO;
    @try {
        (void)(expression);
    } @catch (NSException *exception) {
        didThrow = YES;
        if (![exception isKindOfClass: exceptionClass]) {
            _XCTFailureHandler(self, YES, file.UTF8String, line, _XCTFailureDescription(_XCTAssertion_Fail, 0), @"" @"Unexpected exception get thrown: %@. %@", exception, message);
        }
    } @catch (...) {
        didThrow = YES;
        _XCTFailureHandler(self, YES, file.UTF8String, line, _XCTFailureDescription(_XCTAssertion_Fail, 0), @"" @"Unkown exception get thrown. %@", message);
    }
    
    if (!didThrow) {
        _XCTFailureHandler(self, YES, file.UTF8String, line, _XCTFailureDescription(_XCTAssertion_Fail, 0), @"" @"No exception get thrown. %@", message);
    }
}

void _XCTSAssertThrowsSpecificNamed(XCTestCase * self, void (^ expression)(void), NSString * exceptionName, NSString * message, NSString * file, NSUInteger line) {
    BOOL didThrow = NO;
    @try {
        (void)(expression);
    } @catch (NSException *exception) {
        didThrow = YES;
        if (![exception.name isEqualToString: exceptionName]) {
            _XCTFailureHandler(self, YES, file.UTF8String, line, _XCTFailureDescription(_XCTAssertion_Fail, 0), @"" @"Unexpected exception name: %@. %@", exception.name, message);
        }
    } @catch (...) {
        didThrow = YES;
        _XCTFailureHandler(self, YES, file.UTF8String, line, _XCTFailureDescription(_XCTAssertion_Fail, 0), @"" @"Unkown exception get thrown. %@", message);
    }
    
    if (!didThrow) {
        _XCTFailureHandler(self, YES, file.UTF8String, line, _XCTFailureDescription(_XCTAssertion_Fail, 0), @"" @"No exception get thrown. %@", message);
    }
}

