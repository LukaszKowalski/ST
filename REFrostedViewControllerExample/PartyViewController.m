//
//  DEMOMenuViewController.m
//  REFrostedViewControllerExample
//
//  Created by Roman Efimov on 9/18/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "PartyViewController.h"
#import "DEMOMenuViewController.h"
#import "STCategoryViewController.h"
#import "DEMOSecondViewController.h"
#import "DEMONavigationController.h"
#import "UIViewController+REFrostedViewController.h"
#import "SideBarContent.h"
#import "PartyTableViewCell.h"

#define Category_Box_Height 72
#define Category_Subclass_Height 36
#define Category_Object_Height 152

@interface PartyViewController ()

@property (nonatomic, strong) DEMOMenuViewController *sidebar;
@property (nonatomic, strong) NSMutableArray *expandedPaths;

@end

@implementation PartyViewController


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
        self.search.backgroundColor = [UIColor blueColor];

    }
    if (scrollView.contentOffset.y < Category_Box_Height) {
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
//    PartyTableViewCell *cell = (PartyTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];

    if(self.expandedPaths == nil) {
        self.expandedPaths = [[NSMutableArray alloc] init];
    }
    
    if([self.expandedPaths containsObject:indexPath]) {
        [self.expandedPaths removeObject:indexPath];

    } else {
        [self.expandedPaths addObject:indexPath];
    }
    
    NSLog(@"komorki rozszerzone %@", self.expandedPaths);
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
    
    static NSString *cellIdentifier = @"Cell";
    static NSString *SpecialCellIdentifier = @"SpecialCell";

    if([self.expandedPaths containsObject:indexPath]) {
        self.cellOpened = YES;
    }else{
        self.cellOpened = NO;
    }

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    PartyTableViewCell *specialCell = [[PartyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SpecialCellIdentifier cellOpened:self.cellOpened];

    //
    if (cell == nil || indexPath.row == 0) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
 
    

    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    specialCell.selectionStyle = UITableViewCellSelectionStyleNone;

    NSLog(@"sprawdzam wysokosc %f", cell.frame.size.height);

    if (indexPath.row == 0) {
        
        UIView *categoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, Category_Box_Height - 6 )];
        categoryView.backgroundColor = [UIColor blueColor];
        [cell addSubview:categoryView];
        
        UILabel *categoryName = [[UILabel alloc] initWithFrame:CGRectMake(categoryView.frame.origin.x + 20, categoryView.frame.origin.y + categoryView.frame.size.height/2 -7, 100, 20)];
        categoryName.text = @"Impreza";
        categoryName.textAlignment = NSTextAlignmentLeft;
        categoryName.textColor = [UIColor whiteColor];
        [categoryView addSubview:categoryName];
        
        UIButton *changeDay = [[UIButton alloc] init];
        [changeDay addTarget:self action:@selector(changeDay) forControlEvents:UIControlEventTouchUpInside];
        changeDay.frame = CGRectMake(categoryView.frame.origin.x + 170, categoryView.frame.origin.y + categoryView.frame.size.height/2 -7, 100, 15);
        changeDay.backgroundColor = [UIColor redColor];
        changeDay.titleLabel.text = @"Dzisiaj";
        [categoryView addSubview:changeDay];
        
        return cell;
    }
    return specialCell;
}

@end
