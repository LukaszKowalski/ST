//
//  DEMOMenuViewController.h
//  REFrostedViewControllerExample
//
//  Created by Roman Efimov on 9/18/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import "PartyViewController.h"
#import "CoffeeViewController.h"
#import "BeerViewController.h"
#import "FoodViewController.h"

@interface DEMOMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) UIView *search;
@property (strong, nonatomic) PartyViewController *partyViewController;
@property (strong, nonatomic) CoffeeViewController *coffeeViewController;
@property (strong, nonatomic) BeerViewController *beerViewController;
@property (strong, nonatomic) FoodViewController *foodViewController;



@end
