//
//  DEMOHomeViewController.h
//  REFrostedViewControllerExample
//
//  Created by Roman Efimov on 9/18/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpareTimeCategoryButton.h"
#import "PartyViewController.h"
#import "DEMOMenuViewController.h"

@interface STCategoryViewController : UIViewController

@property (strong, nonatomic) UIView *buttonView;
@property (strong, nonatomic) UIImageView *buttonIcon;
@property (strong, nonatomic) UIImageView *background;
@property (strong, nonatomic) UILabel *buttonName;
@property (strong, nonatomic) NSMutableDictionary *backgroundsWithTags;
@property (strong, nonatomic) UIViewController *mainScreenViewController;

@end
