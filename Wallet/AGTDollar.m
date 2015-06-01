//
//  AGTDollar.m
//  Wallet
//
//  Created by Fernando Rodríguez Romero on 01/06/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AGTDollar.h"

@interface AGTDollar ()
@property (nonatomic) NSUInteger amount;
@end
@implementation AGTDollar

-(id) initWithAmount:(NSUInteger) amount{
    
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
    
}

-(AGTMoney*) times:(NSUInteger) multiplier{
    return [[AGTDollar alloc]
            initWithAmount:self.amount * multiplier];
}


#pragma mark - Equality
-(BOOL)isEqual:(id)object{
    
    return [self amount] == [object amount];
}




@end


