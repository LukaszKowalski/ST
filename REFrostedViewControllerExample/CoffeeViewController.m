//
//  CoffeeViewController.m
//  SpareTime
//
//  Created by Łukasz Kowalski on 17/12/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "CoffeeViewController.h"
#import "STCategoryViewController.h"
#import "DEMOSecondViewController.h"
#import "DEMONavigationController.h"
#import "UIViewController+REFrostedViewController.h"
#import "SideBarContent.h"

#define Category_Box_Height 72
#define Category_Subclass_Height 36
#define Category_Object_Height 146

@interface CoffeeViewController ()

@property (nonatomic, strong) DEMOMenuViewController *sidebar;
@property (nonatomic, strong) NSMutableArray *expandedPaths;

@end

@implementation CoffeeViewController


- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    
    self.search = [[UIView alloc] initWithFrame:CGRectMake(8, 8, 274, 36)];
    self.search.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.search];
    
    UITextField *serchTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, 5, 274, 36)];
    
    UIColor *color = [UIColor whiteColor];
    serchTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Szukaj" attributes:@{NSForegroundColorAttributeName: color}];
    
    serchTextField.textColor = [UIColor whiteColor];
    [self.search addSubview: serchTextField];
    
    //    [self.view addSubview:self.tableView];
    
}
-(void)resetTableView{
    [self.tableView reloadData];
    NSLog(@"reset");
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y >= Category_Box_Height) {
        NSLog(@"scroll");
        self.search.backgroundColor = [UIColor blueColor];
        
    }
    if (scrollView.contentOffset.y < Category_Box_Height) {
        NSLog(@"scroll");
        self.search.backgroundColor = [UIColor clearColor];
        
    }
    
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(self.expandedPaths == nil) {
        self.expandedPaths = [[NSMutableArray alloc] init];
    }
    
    if([self.expandedPaths containsObject:indexPath]) {
        [self.expandedPaths removeObject:indexPath];
    } else {
        [self.expandedPaths addObject:indexPath];
    }
    
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:indexPath.row inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.expandedPaths containsObject:indexPath]) {
        if (indexPath.row == 0 ) {
            return Category_Box_Height;
        }
        return 250;
        
    } else {
        if (indexPath.row == 0 ) {
            return Category_Box_Height;
        }
        NSLog(@"sprawdzam wysokosc ");
        
        return Category_Object_Height;
    }
    
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
    
    static NSString *cellIdentifier = @"closedCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //
    if (cell == nil || indexPath.row == 0) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSLog(@"sprawdzam wysokosc %f", cell.frame.size.height);
    
    if (indexPath.row == 0) {
        
        UIView *categoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, Category_Box_Height - 6 )];
        categoryView.backgroundColor = [UIColor blueColor];
        [cell addSubview:categoryView];
        
        UILabel *categoryName = [[UILabel alloc] initWithFrame:CGRectMake(categoryView.frame.origin.x + 20, categoryView.frame.origin.y + categoryView.frame.size.height/2 -7, 100, 15)];
        categoryName.text = [[SideBarContent sharedInstance] getSideBarCategory];
        categoryName.textAlignment = NSTextAlignmentLeft;
        categoryName.textColor = [UIColor whiteColor];
        [categoryView addSubview:categoryName];
        
    } else {
        
                
    }
    return cell;
}

@end
