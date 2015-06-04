//
//  LMTWalletTableVCTests.m
//  Wallet
//
//  Created by Luis M Tolosana Simon on 4/6/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "LMTWalletTableViewController.h"
#import "LMTWallet.h"

@interface LMTWalletTableVCTests : XCTestCase

@property (nonatomic, strong) LMTWalletTableViewController *walletVC;
@property (nonatomic, strong) LMTWallet *wallet;

@end

@implementation LMTWalletTableVCTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.wallet = [[LMTWallet alloc] initWithAmount:1
                                           currency:@"USD"];
    [self.wallet plus:[AGTMoney euroWithAmount:1]];
    
    self.walletVC = [[LMTWalletTableViewController alloc] initWithModel:self.wallet];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//-(void) testThatTableHasOneSection{
//    
//    NSInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
//    XCTAssertEqual(sections, 1, @"There can only be one!");
//    
//}

-(void) testThatNumberOfSectionsIsNumberOfCurrenciesPlusOne{
    
    NSInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    XCTAssertEqual(sections, self.wallet.countCurrencies + 1, @"Number of sections is the number of unique currencies + 1");
}



-(void) testThatNumberOfCellsIsNumberOfMoneysPlusOne{
    
    XCTAssertEqual(self.wallet.count + 1, [self.walletVC tableView:nil numberOfRowsInSection:0], @"Number of cells is the number of moneys plus 1 (the total)");
}



@end
