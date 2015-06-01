//
//  AGTMoney.m
//  Wallet
//
//  Created by Fernando Rodríguez Romero on 01/06/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "NSObject+GNUStep.h"
#import "AGTMoney.h"

@implementation AGTMoney

-(id) initWithAmount:(NSUInteger)amount{
    
    return [self subclassResponsibility:_cmd];
}

-(AGTMoney*) times:(NSUInteger)multiplier{
    return [self subclassResponsibility:_cmd];
}


@end
