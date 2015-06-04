//
//  LMTBroker.m
//  Wallet
//
//  Created by Luis M Tolosana Simon on 3/6/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "LMTBroker.h"
#import "AGTMoney.h"


@implementation LMTBroker

- (instancetype)init
{
    self = [super init];
    if (self) {
        _rates = [@{} mutableCopy];
    }
    
    return self;
}

-(AGTMoney *) reduce:(id<AGTMoney>) money toCurrency:(NSString *) currency{

    // Double dispatch
    return [money reduceToCurrency:currency
                        withBroker:self];
}

-(void) addRate:(NSUInteger) rate fromCurrency:(NSString *) fromCurrency toCurrency:(NSString *) toCurrency{

    [self.rates setObject:@(rate)
                   forKey:[self keyFromCurrency:fromCurrency
                                     toCurrency:toCurrency]];
        
}

#pragma mark - Utils
-(NSString *) keyFromCurrency:(NSString *) fromCurrency toCurrency:(NSString *) toCurrency{
    
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}

@end
