//
//  AGTMoney.m
//  Wallet
//
//  Created by Fernando Rodríguez Romero on 01/06/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//


#import "AGTMoney.h"
#import "LMTBroker.h"


@interface AGTMoney ()
@property (nonatomic) NSUInteger amount;
@end
@implementation AGTMoney

+(instancetype) dollarWithAmount:(NSUInteger) amount{
    
    AGTMoney *dollar = [[AGTMoney alloc] initWithAmount:amount
                                               currency:@"USD"];
    return dollar;
}


+(instancetype) euroWithAmount:(NSUInteger) amount{
    
    AGTMoney *euro = [[AGTMoney alloc] initWithAmount:amount
                                               currency:@"EUR"];
    return euro;

}

-(id) initWithAmount:(NSUInteger)amount
            currency:(NSString *)currency{
    
    if (self = [super init]) {
        _amount = amount;
        _currency = currency;
    }
    
    return self;

}

-(id<AGTMoney>) times:(NSUInteger)multiplier{
    
    return [[AGTMoney alloc]
            initWithAmount:_amount * multiplier
            currency:self.currency];
}

-(id<AGTMoney>) plus:(AGTMoney *) other{
    
    NSUInteger totalAmount = self.amount + other.amount;
    AGTMoney *total = [[AGTMoney alloc] initWithAmount:totalAmount
                                              currency:self.currency];
    
    return total;
}

-(id<AGTMoney>) reduceToCurrency:(NSString *) currency withBroker:(LMTBroker *)broker{
    
    
    AGTMoney *result;
    NSUInteger rate = [[broker.rates objectForKey:[broker keyFromCurrency:self.currency
                                                           toCurrency:currency]] integerValue];
    
    // Comprobamos que divisa de origen y destino son las mismas
    if ([self.currency isEqual:currency]) {
        result = self;
    }else if (rate == 0){
        // no hay tasa de convesrion, excepcion que te crio
        [NSException raise:@"NoConversionRateException"
                    format:@"Must have a conversion from %@ to %@", self.currency, currency];
    }else{
        // Tenemos conversion
        //        NSUInteger rate = [[self.rates objectForKey:[self keyFromCurrency:money.currency
        //                                                              toCurrency:currency]] integerValue];
        NSUInteger newAmount = self.amount * rate;
        
        result = [[AGTMoney alloc] initWithAmount:newAmount
                                         currency:currency];
    }
    
    
    return result;

    
}


#pragma mark - Description
//-(NSString *) description{
//    
//    return [NSString stringWithFormat:@"<%@: %@ %@>", [self class], self.currency, self.amount];
//}


#pragma mark - Equality
-(BOOL)isEqual:(id)object{
    
    if ([self.currency isEqual:[object currency] ]) {
        return [self amount] == [object amount];
    }else{
        return NO;
    }
    
}

-(NSUInteger) hash{
    
    return self.amount;
}


@end
