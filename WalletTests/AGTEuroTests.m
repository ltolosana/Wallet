//
//  AGTEuroTests.m
//  Wallet
//
//  Created by Fernando Rodríguez Romero on 01/06/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "AGTEuro.h"

@interface AGTEuroTests : XCTestCase

@end

@implementation AGTEuroTests

- (void)setUp {
    [super setUp];
    // Creo el entorno
    
}

- (void)tearDown {
    [super tearDown];
    
    // Me cargo en entorno
    
}

-(void) testMultiplication{
    
    
    AGTEuro *five = [[AGTEuro alloc]initWithAmount:5];
    AGTEuro *product = [five times: 2];
    XCTAssertEqualObjects(product, [[AGTEuro alloc]initWithAmount:10]);
    
    
}

-(void) testEquality{
    
    AGTEuro *five = [[AGTEuro alloc] initWithAmount:5];
    AGTEuro *otherFive = [[AGTEuro alloc] initWithAmount:5];
    
    XCTAssertEqualObjects(five, otherFive);
    
    
    AGTEuro *seven = [[AGTEuro alloc] initWithAmount:7];
    
    XCTAssertNotEqualObjects(seven, five);
    
    
}















@end
