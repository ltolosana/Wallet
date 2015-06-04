//
//  LMTBrokerTests.m
//  Wallet
//
//  Created by Luis M Tolosana Simon on 3/6/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AGTMoney.h"
#import "LMTBroker.h"

@interface LMTBrokerTests : XCTestCase

@property (nonatomic, strong) LMTBroker *emptyBroker;
@property (nonatomic, strong) AGTMoney *oneDollar;

@end

@implementation LMTBrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.emptyBroker = [[LMTBroker alloc] init];
    self.oneDollar = [AGTMoney dollarWithAmount:1];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    self.emptyBroker = nil;
    self.oneDollar = nil;
}


-(void) testSimpleReduction{
    
    AGTMoney *sum = [[AGTMoney dollarWithAmount:5] plus:[AGTMoney dollarWithAmount:5]];
    
    AGTMoney *reduced = [self.emptyBroker reduce: sum toCurrency: @"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
    
}

// $10 = 5€ 2:1
-(void) testReduction{
    
    [self.emptyBroker addRate: 2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    AGTMoney *dollars = [AGTMoney dollarWithAmount:10];
    AGTMoney *euros = [AGTMoney euroWithAmount:5];
    
    AGTMoney *converted = [self.emptyBroker reduce:euros
                              toCurrency:@"USD"];
    
    XCTAssertEqualObjects(converted, dollars, @"$10 = 5€ 2:1");
}


-(void) testThatNoRateRaisesException{
    
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"], @"No rates should cause exception");
}


-(void) testThatNilConversionDoesNotChangeMoney{
    
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar toCurrency:@"USD"], @"A nil conversion should have no effect");
}

@end
