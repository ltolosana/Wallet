//
//  LMTBroker.m
//  Wallet
//
//  Created by Luis M Tolosana Simon on 3/6/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "LMTBroker.h"
#import "AGTMoney.h"

@interface LMTBroker ()

@property (nonatomic, strong) NSMutableDictionary *rates;

@end

@implementation LMTBroker

- (instancetype)init
{
    self = [super init];
    if (self) {
        _rates = [@{} mutableCopy];
    }
    
    return self;
}

-(AGTMoney *) reduce:(AGTMoney *) money toCurrency:(NSString *) currency{

    AGTMoney *result;
    NSUInteger rate = [[self.rates objectForKey:[self keyFromCurrency:money.currency
                                                           toCurrency:currency]] integerValue];
    
    // Comprobamos que divisa de origen y destino son las mismas
    if ([money.currency isEqual:currency]) {
        result = money;
    }else if (rate == 0){
        // no hay tasa de convesrion, excepcion que te crio
        [NSException raise:@"NoConversionRateException"
                    format:@"Must have a conversion from %@ to %@", money.currency, currency];
    }else{
        // Tenemos conversion
//        NSUInteger rate = [[self.rates objectForKey:[self keyFromCurrency:money.currency
//                                                              toCurrency:currency]] integerValue];
        NSUInteger newAmount = money.amount * rate;
        
        result = [[AGTMoney alloc] initWithAmount:newAmount
                                                     currency:currency];
    }
    

    return result;
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
