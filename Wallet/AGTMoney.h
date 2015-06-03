//
//  AGTMoney.h
//  Wallet
//
//  Created by Fernando Rodríguez Romero on 01/06/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGTMoney : NSObject

@property (copy, readonly) NSString *currency;

+(instancetype) dollarWithAmount:(NSUInteger) amount;
+(instancetype) euroWithAmount:(NSUInteger) amount;

-(id) initWithAmount:(NSUInteger) amount
            currency:(NSString*) currency;

-(AGTMoney*) times:(NSUInteger) multiplier;

-(AGTMoney *) plus:(AGTMoney *) other;

@end
