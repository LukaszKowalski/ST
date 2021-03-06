//
//  BeerViewController.m
//  SpareTime
//
//  Created by Łukasz Kowalski on 17/12/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "BeerViewController.h"
#import "STCategoryViewController.h"
#import "DEMOSecondViewController.h"
#import "DEMONavigationController.h"
#import "UIViewController+REFrostedViewController.h"
#import "SideBarContent.h"

#define Category_Box_Height 72
#define Category_Subclass_Height 36
#define Category_Object_Height 146

@interface BeerViewController ()



@end

@implementation BeerViewController


- (void)viewDidLoad
{
    
 
    [super viewDidLoad];
    
    UIView *search = [[UIView alloc] initWithFrame:CGRectMake(8, 8, 274, 36)];
    search.backgroundColor = [UIColor clearColor];
    [self.view addSubview:search];
    
    UITextField *serchTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, 5, 274, 36)];
    
    UIColor *color = [UIColor whiteColor];
    serchTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Szukaj" attributes:@{NSForegroundColorAttributeName: color}];
    
    serchTextField.textColor = [UIColor whiteColor];
    [search addSubview: serchTextField];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(8, 50, self.view.frame.size.width - 64, 550)];
    self.tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.opaque = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableView];
    
}
-(void)resetTableView{
    [self.tableView reloadData];
    NSLog(@"reset");
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex
//{
//    if (sectionIndex == 0)
//        return nil;
//
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 34)];
//    view.backgroundColor = [UIColor colorWithRed:167/255.0f green:167/255.0f blue:167/255.0f alpha:0.6f];
//
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 0, 0)];
//    label.text = [[SideBarContent sharedInstance] getSideBarCategory];
//    label.font = [UIFont systemFontOfSize:15];
//    label.textColor = [UIColor whiteColor];
//    label.backgroundColor = [UIColor clearColor];
//    [label sizeToFit];
//    [view addSubview:label];
//
//    return view;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // selection
    
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 ) {
        return Category_Box_Height;
    }
    return Category_Object_Height;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"Cell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //
    if (cell == nil || indexPath.row == 0) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.row == 0) {
        
        UIView *categoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, Category_Box_Height - 6 )];
        categoryView.backgroundColor = [UIColor greenColor];
        [cell addSubview:categoryView];
        
        UILabel *categoryName = [[UILabel alloc] initWithFrame:CGRectMake(categoryView.frame.origin.x + 20, categoryView.frame.origin.y + categoryView.frame.size.height/2 -7, 100, 15)];
        categoryName.text = [[SideBarContent sharedInstance] getSideBarCategory];
        categoryName.textAlignment = NSTextAlignmentLeft;
        categoryName.textColor = [UIColor whiteColor];
        [categoryView addSubview:categoryName];
        
    } else {
        
        UIView *categoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, Category_Object_Height - 6)];
        categoryView.backgroundColor = [UIColor whiteColor];
        [cell addSubview:categoryView];
        UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, categoryView.frame.size.width /3, 90)];
        [categoryView addSubview:imageView1];
        UIImage *image1 = [UIImage imageNamed:@"kawa1"];
        imageView1.image = image1;
        UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(categoryView.frame.size.width /3, 0, categoryView.frame.size.width /3, 90)];
        [categoryView addSubview:imageView2];
        UIImage *image2 = [UIImage imageNamed:@"kawa2"];
        imageView2.image = image2;
        UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(categoryView.frame.size.width *2 /3, 0, categoryView.frame.size.width /3, 90)];
        UIImage *image3 = [UIImage imageNamed:@"kawa3"];
        imageView3.image = image3;
        [categoryView addSubview:imageView3];
        
    }
    return cell;
}

@end