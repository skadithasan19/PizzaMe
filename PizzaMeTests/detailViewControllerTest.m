//
//  detailViewControllerTest.m
//  PizzaMe
//
//  Created by Md Adit Hasan on 4/5/16.
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "iService.h"
@interface detailViewControllerTest : XCTestCase

@end

@implementation detailViewControllerTest

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
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [iService callToMobileNumber:@"6414517782" completionHandler:^(BOOL success) {
        
        XCTAssertTrue(success);
        
    } controller:[[UIViewController alloc] init]];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
