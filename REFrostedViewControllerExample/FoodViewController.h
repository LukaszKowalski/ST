//
//  FoodViewController.h
//  SpareTime
//
//  Created by Łukasz Kowalski on 17/12/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;


@end
