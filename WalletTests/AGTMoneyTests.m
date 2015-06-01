//
//  AGTMoneyTests.m
//  Wallet
//
//  Created by Fernando Rodríguez Romero on 01/06/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

@import Foundation;
#import <XCTest/XCTest.h>
#import "AGTMoney.h"

@interface AGTMoneyTests : XCTestCase

@end

@implementation AGTMoneyTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testThatInitDoesNotRaiseException{
    
    
    XCTAssertNoThrow([[AGTMoney alloc] initWithAmount:3]);
    
    
}















@end
