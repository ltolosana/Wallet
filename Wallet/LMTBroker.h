//
//  LMTBroker.h
//  Wallet
//
//  Created by Luis M Tolosana Simon on 3/6/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

@import Foundation;
@class AGTMoney;

@interface LMTBroker : NSObject

-(AGTMoney *) reduce:(AGTMoney *) money toCurrency:(NSString *) currency;

-(void) addRate:(NSUInteger) rate fromCurrency:(NSString *) fromCurrency toCurrency:(NSString *) toCurrency;

@end
