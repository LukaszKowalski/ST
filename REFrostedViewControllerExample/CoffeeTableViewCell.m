//
//  CoffeeTableViewCell.m
//  SpareTime
//
//  Created by Łukasz Kowalski on 19/12/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "CoffeeTableViewCell.h"
#define Category_Box_Height 72
#define Category_Subclass_Height 36
#define Category_Object_Height 146


@implementation CoffeeTableViewCell


- (void)awakeFromNib {
    
    UIView *categoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 284, Category_Object_Height - 6)];
    if (self.cellState == 250) {
        categoryView.frame = CGRectMake(0, 0, cell.frame.size.width, 250 - 6);
    }
    categoryView.backgroundColor = [UIColor whiteColor];
    [cell addSubview:categoryView];
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, categoryView.frame.size.width /3, 90)];
    [categoryView addSubview:imageView1];
    imageView1.contentMode = UIViewContentModeScaleAspectFit;
    UIImage *image1 = [UIImage imageNamed:@"kawa1"];
    imageView1.image = image1;
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(categoryView.frame.size.width /3, 0, categoryView.frame.size.width /3, 90)];
    [categoryView addSubview:imageView2];
    imageView2.contentMode = UIViewContentModeScaleAspectFit;
    UIImage *image2 = [UIImage imageNamed:@"kawa2"];
    imageView2.image = image2;
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(categoryView.frame.size.width *2 /3, 0, categoryView.frame.size.width /3, 90)];
    UIImage *image3 = [UIImage imageNamed:@"kawa3"];
    imageView3.contentMode = UIViewContentModeScaleAspectFit;
    imageView3.image = image3;
    [categoryView addSubview:imageView3];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
