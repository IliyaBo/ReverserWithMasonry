//
//  ReverserUITests.m
//  ReverserUITests
//
//  Created by Alexey Ulenkov on 25.02.17.
//  Copyright © 2017 Alexey Ulenkov. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ReverserUITests : XCTestCase

@end

@implementation ReverserUITests

- (void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
    [[[XCUIApplication alloc] init] launch];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testExample {
    NSString *reversedString = @"!olleH";
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *textField = [[app.otherElements containingType:XCUIElementTypeButton identifier:@"REVERSE"] childrenMatchingType:XCUIElementTypeTextField].element;
    [textField tap];
    [textField typeText:@"Hello!"];
    [app.buttons[@"Next:"] tap];
    [app.buttons[@"REVERSE"] tap];

    XCUIElement *resultLabel = [app.staticTexts elementMatchingType:XCUIElementTypeAny identifier:reversedString];
    
    XCTAssertNotNil(resultLabel, @"Basic");
}

@end
