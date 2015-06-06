//
//  LMTWallet.h
//  Wallet
//
//  Created by Luis M Tolosana Simon on 4/6/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

@import Foundation;
#import "AGTMoney.h"

@interface LMTWallet : NSObject<AGTMoney>

@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) NSInteger countCurrencies;
@property (nonatomic, readonly) NSUInteger countEuros;
@property (nonatomic, readonly) NSUInteger countDollars;

-(LMTWallet *) takeMoney: (AGTMoney *) money;

@end
