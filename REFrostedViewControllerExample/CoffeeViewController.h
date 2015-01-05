//
//  CoffeeViewController.h
//  SpareTime
//
//  Created by Łukasz Kowalski on 17/12/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoffeeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIView *search;


@end
