//
//  LMTWalletTableViewController.h
//  Wallet
//
//  Created by Luis M Tolosana Simon on 4/6/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LMTWallet;

@interface LMTWalletTableViewController : UITableViewController

-(id) initWithModel:(LMTWallet *) model;

@end
