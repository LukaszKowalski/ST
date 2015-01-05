//
//  PartyTableViewCell.m
//  SpareTime
//
//  Created by Łukasz Kowalski on 05/01/15.
//  Copyright (c) 2015 Roman Efimov. All rights reserved.
//

#import "PartyTableViewCell.h"
#define Category_Box_Height 72
#define Category_Subclass_Height 36
#define Category_Object_Height 152

@implementation PartyTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier cellOpened:(BOOL)cellOpened{
    NSLog(@"creating cell");
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
    
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.categoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, Category_Object_Height - 6)];
        if (self.frame.size.height == 250) {
            self.categoryView.frame = CGRectMake(0, 0, self.frame.size.width, 250 - 6);
        }
        self.categoryView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.categoryView];
        UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.categoryView.frame.size.width /3, 90)];
        [self.categoryView addSubview:imageView1];
        imageView1.contentMode = UIViewContentModeScaleAspectFit;
        UIImage *image1 = [UIImage imageNamed:@"kawa1"];
        imageView1.image = image1;
        
        UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.categoryView.frame.size.width /3, 0, self.categoryView.frame.size.width /3, 90)];
        [self.categoryView addSubview:imageView2];
        imageView2.contentMode = UIViewContentModeScaleAspectFit;
        UIImage *image2 = [UIImage imageNamed:@"kawa2"];
        imageView2.image = image2;
        
        UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.categoryView.frame.size.width *2 /3, 0, self.categoryView.frame.size.width /3, 90)];
        UIImage *image3 = [UIImage imageNamed:@"kawa3"];
        imageView3.contentMode = UIViewContentModeScaleAspectFit;
        imageView3.image = image3;
        
        [self.categoryView addSubview:imageView3];
        
        if (cellOpened == YES) {
            [UIView animateWithDuration:.35 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.categoryView.frame = CGRectMake(0, 0, self.frame.size.width, 250 - 6);
            } completion:^(BOOL finished) {
                
            }];
        }

    }
    
    
return self;

}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    
//    if (selected == YES) {
//        NSLog(@"zaznaczone %@", self.description);
//        self.categoryView.backgroundColor = [UIColor redColor];
//    }else{
//        NSLog(@"odznaczone");
//        self.categoryView.backgroundColor = [UIColor whiteColor];
//
//    }
//
//}



@end

//else {
//    
//    UIView *categoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, Category_Object_Height - 6)];
//    if (cell.frame.size.height == 250) {
//        categoryView.frame = CGRectMake(0, 0, cell.frame.size.width, 250 - 6);
//    }
//    categoryView.backgroundColor = [UIColor whiteColor];
//    [cell addSubview:categoryView];
//    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, categoryView.frame.size.width /3, 90)];
//    [categoryView addSubview:imageView1];
//    imageView1.contentMode = UIViewContentModeScaleAspectFit;
//    UIImage *image1 = [UIImage imageNamed:@"kawa1"];
//    imageView1.image = image1;
//    
//    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(categoryView.frame.size.width /3, 0, categoryView.frame.size.width /3, 90)];
//    [categoryView addSubview:imageView2];
//    imageView2.contentMode = UIViewContentModeScaleAspectFit;
//    UIImage *image2 = [UIImage imageNamed:@"kawa2"];
//    imageView2.image = image2;
//    
//    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(categoryView.frame.size.width *2 /3, 0, categoryView.frame.size.width /3, 90)];
//    UIImage *image3 = [UIImage imageNamed:@"kawa3"];
//    imageView3.contentMode = UIViewContentModeScaleAspectFit;
//    imageView3.image = image3;
//    [categoryView addSubview:imageView3];
//    
//}