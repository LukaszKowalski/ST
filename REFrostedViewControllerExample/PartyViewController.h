//
//  PartyViewController.h
//  SpareTime
//
//  Created by Łukasz Kowalski on 15/12/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PartyViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIView *search;
@property (nonatomic, assign) BOOL cellOpened;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier cellOpened:(BOOL)cellOpened;
@end
