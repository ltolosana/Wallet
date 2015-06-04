//
//  LMTWallet.m
//  Wallet
//
//  Created by Luis M Tolosana Simon on 4/6/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "LMTWallet.h"

@interface LMTWallet ()

@property (nonatomic, strong) NSMutableArray *moneys;

@end

@implementation LMTWallet

-(id) initWithAmount:(NSUInteger)amount currency:(NSString *)currency{
    
    if (self = [super init]) {
        AGTMoney *money = [[AGTMoney alloc] initWithAmount:amount
                                                  currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    
    return self;
}

-(id<AGTMoney>) plus:(AGTMoney *)other{
    
    [self.moneys addObject:other];
    return self;
}

-(id<AGTMoney>) times:(NSUInteger)multiplier{
    
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    for (AGTMoney *each in self.moneys) {
        
        AGTMoney *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
    }
    self.moneys = newMoneys;
    return self;
    
}

-(id<AGTMoney>) reduceToCurrency:(NSString *)currency withBroker:(LMTBroker *)broker{
    
    AGTMoney *result = [[AGTMoney alloc] initWithAmount:0 currency:currency];
    
    for (AGTMoney *each in self.moneys) {
        
        result = [result plus:[each reduceToCurrency:currency withBroker:broker] ];
    }
    
    return result;
}


@end
