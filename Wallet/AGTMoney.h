//
//  AGTMoney.h
//  Wallet
//
//  Created by Fernando Rodríguez Romero on 01/06/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AGTMoney;

@protocol AGTMoney <NSObject>

-(id) initWithAmount:(NSUInteger) amount
            currency:(NSString*) currency;

-(id<AGTMoney>) times:(NSUInteger) multiplier;

-(id<AGTMoney>) plus:(AGTMoney *) other;

@end

@interface AGTMoney : NSObject<AGTMoney>

@property (nonatomic, readonly) NSUInteger amount;
@property (nonatomic, copy, readonly) NSString *currency;

+(instancetype) dollarWithAmount:(NSUInteger) amount;
+(instancetype) euroWithAmount:(NSUInteger) amount;


@end
