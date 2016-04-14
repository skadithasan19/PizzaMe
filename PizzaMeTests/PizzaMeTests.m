//
//  PizzaMeTests.m
//  PizzaMeTests
//
//  Created by Md Adit Hasan on 4/4/16.
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "APICall.h"
@interface PizzaMeTests : XCTestCase

@end

@implementation PizzaMeTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    

}

- (void)testExample {
    // This is an example of a functional test case.
    [APICall loadNearByPizza:@"78758" pizzas:^(NSArray *pizzas) {
        XCTAssertTrue([pizzas count]==10);
    }];

    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
