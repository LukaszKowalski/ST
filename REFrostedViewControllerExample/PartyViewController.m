//
//  PartyViewController.m
//  SpareTime
//
//  Created by Łukasz Kowalski on 15/12/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "PartyViewController.h"

@interface PartyViewController ()

@end

@implementation PartyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITableView *PartyTableView = [[UITableView alloc] init];
    PartyTableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell 
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
