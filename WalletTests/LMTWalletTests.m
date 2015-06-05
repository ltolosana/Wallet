//
//  LMTWalletTests.m
//  Wallet
//
//  Created by Luis M Tolosana Simon on 4/6/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "LMTWallet.h"
#import "AGTMoney.h"
#import "LMTBroker.h"

@interface LMTWalletTests : XCTestCase

@end

@implementation LMTWalletTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// 40€ + $20 = $100 2:1
-(void) testAdditionWithReduction{
    
    LMTBroker *broker = [[LMTBroker alloc] init];
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];

    LMTWallet *wallet = [[LMTWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus: [AGTMoney dollarWithAmount:20]];
    
    AGTMoney *reduced = [broker reduce:wallet toCurrency:@"USD"];
    
    XCTAssertEqualObjects(reduced, [AGTMoney dollarWithAmount:100], @"40€ + $20 = $100 2:1");
    
}

// 1€ + $1 = 2 currencies
-(void) testCountCurrencies{
    
    LMTWallet *wallet = [[LMTWallet alloc] initWithAmount:1 currency:@"EUR"];
    [wallet plus: [AGTMoney dollarWithAmount:1]];

    NSInteger numberOfCurrencies = wallet.countCurrencies;
    
    XCTAssertEqual(numberOfCurrencies, 2, @"1€ + $1 = 2 currencies");
    
}


-(void) testCountEuros{
    
    LMTWallet *wallet = [[LMTWallet alloc] initWithAmount:5 currency:@"EUR"];
    [wallet plus: [AGTMoney dollarWithAmount:5]];
    
    NSInteger numberOfEuros = wallet.countEuros;
    
    XCTAssertEqual(numberOfEuros, 1, @"1 Euro");
    
}

-(void) testCountDollars{
    
    LMTWallet *wallet = [[LMTWallet alloc] initWithAmount:5 currency:@"EUR"];
    [wallet plus: [AGTMoney dollarWithAmount:5]];
    
    NSInteger numberOfDollars = wallet.countDollars;
    
    XCTAssertEqual(numberOfDollars, 1, @"1 Dollar");
    
}



@end
