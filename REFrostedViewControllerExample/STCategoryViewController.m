//
//  DEMOHomeViewController.m
//  REFrostedViewControllerExample
//
//  Created by Roman Efimov on 9/18/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "STCategoryViewController.h"
#import "DEMONavigationController.h"
#import "SideBarContent.h"

@interface STCategoryViewController ()

@end

@implementation STCategoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Home Controller";
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    self.background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 960, self.view.frame.size.height) ];
    [self.background setImage:[UIImage imageNamed:@"bck_food"]];
    self.background.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:self.background];
    
    self.mainScreenViewController = [[UIViewController alloc] init];
    self.mainScreenViewController.view.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.mainScreenViewController.view];
    self.mainScreenViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    NSArray *backgrounds = [[NSArray alloc] initWithObjects:@"bck_beer",@"bck_cinema",@"bck_club",@"bck_coffee",@"bck_custom",@"bck_culture",@"bck_bike",@"bck_sex",@"bck_meeting",@"bck_barsports",@"bck_drink",@"bck_food",@"bck_games",@"bck_smoke", nil];
    self.backgroundsWithTags = [[NSMutableDictionary alloc] init];
    
    for (int i = 0; i < [backgrounds count]; i++) {
        
        NSLog(@"%d", i);
        NSString *element = [backgrounds objectAtIndex:i];
        NSLog (@"Beer: %@", element);
        
        [self.backgroundsWithTags setValue:element forKey:[NSString stringWithFormat:@"%d",i]];
    }
    
    self.buttonView.tag = 666;
    
    [self drawButtonWith:CGRectMake(30, 70, 70, 70) withTag:1 withIcon:@"beer"];
    [self drawButtonWith:CGRectMake(130, 70, 70, 70) withTag:2 withIcon:@"cinema"];
    [self drawButtonWith:CGRectMake(230, 70, 70, 70) withTag:3 withIcon:@"club"];
    
    [self drawButtonWith:CGRectMake(30, 170, 70, 70) withTag:4 withIcon:@"coffee"];
    [self drawButtonWith:CGRectMake(130, 170, 70, 70) withTag:5 withIcon:@"custom"];
    [self drawButtonWith:CGRectMake(230, 170, 70, 70) withTag:6 withIcon:@"culture"];
    
    [self drawButtonWith:CGRectMake(30, 270, 70, 70)withTag:7 withIcon:@"bike"];
    
    [self drawClockWith:CGRectMake(130, 270, 70, 70) withIcon:@"wskazowki"];
    
    [self drawButtonWith:CGRectMake(230, 270, 70, 70)withTag:8 withIcon:@"sex"];
    
    [self drawButtonWith:CGRectMake(30, 370, 70, 70)withTag:9 withIcon:@"meeting"];
    [self drawButtonWith:CGRectMake(130, 370, 70, 70)withTag:10 withIcon:@"barsports"];
    [self drawButtonWith:CGRectMake(230, 370, 70, 70)withTag:11 withIcon:@"drink"];
    
    [self drawButtonWith:CGRectMake(30, 470, 70, 70)withTag:12 withIcon:@"food"];
    [self drawButtonWith:CGRectMake(130, 470, 70, 70)withTag:13 withIcon:@"games"];
    [self drawButtonWith:CGRectMake(230, 470, 70, 70)withTag:14 withIcon:@"smoke"];
    
}

- (void)buttonFired:(id)sender{
    
    NSLog(@"sender: %@", sender);
    
    UIView *buttonContent = [sender superview];
    NSLog(@"buttonContent :%@", buttonContent);
    
    UIView *buttonLayer = [buttonContent viewWithTag:16];
    
    UIImageView *buttonImageInView = (UIImageView*)[buttonContent viewWithTag:17];
    
    UILabel *buttonNameInView = (UILabel *)[buttonContent viewWithTag:18];
    
    SpareTimeCategoryButton *button = (SpareTimeCategoryButton *)[buttonContent viewWithTag:[sender tag]];
    
    if (button.buttonClicked == YES) {
        
        [self.background setImage:[UIImage imageNamed:@"background"]];
        
        buttonLayer.backgroundColor = [UIColor blackColor];
        buttonNameInView.hidden = YES;
        buttonImageInView.hidden = NO;
        button.buttonClicked = NO;
        
    }else if (button.buttonClicked == NO){
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"resetsideBar" object:nil];
        
        [[SideBarContent sharedInstance] sideBarCategory:[(UILabel *)[buttonContent viewWithTag:18] text]];
        [UIView animateWithDuration:5.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self.background setImage:[UIImage imageNamed:[self.backgroundsWithTags objectForKey:[NSString stringWithFormat:@"%ld",(long)[sender tag]-1]]]];
        } completion:^(BOOL finished) {
            
        }];
        
        [self.background setImage:[UIImage imageNamed:[self.backgroundsWithTags objectForKey:[NSString stringWithFormat:@"%ld",(long)[sender tag]-1]]]];
        buttonLayer.backgroundColor = [UIColor redColor];
        buttonNameInView.hidden = NO;
        buttonImageInView.hidden = YES;
        button.buttonClicked = YES;
        [self animateCircle:buttonLayer];
    }
}

- (void) animateCircle:(UIView *)view{
    
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = 0.2;
    scaleAnimation.fromValue = [NSNumber numberWithFloat:.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1];
    
    [view.layer addAnimation:scaleAnimation forKey:@"scale"];}

-(void)drawButtonWith:(CGRect)rect withTag:(NSUInteger)tag withIcon:(NSString *)iconName{
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blur];
    visualEffectView.frame = rect;
    
    self.buttonView =  visualEffectView;
    self.buttonView.clipsToBounds= YES;
    self.buttonView.alpha = 0.90;
    self.buttonView.layer.cornerRadius = self.buttonView.frame.size.height/2.0f;
    
    UIView *lightdark = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    lightdark.tag = 16;
    lightdark.clipsToBounds= YES;
    lightdark.layer.cornerRadius = self.buttonView.frame.size.height/2.0f;
    
    lightdark.backgroundColor = [UIColor blackColor];
    lightdark.alpha = 0.2;
    
    [self.buttonView addSubview:lightdark];
    [self.buttonView bringSubviewToFront:lightdark];
    
    self.buttonIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    self.buttonIcon.tag = 17;
    self.buttonIcon.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.buttonIcon setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png", iconName]]];
    [self.buttonView addSubview:self.buttonIcon];
    
    SpareTimeCategoryButton *button = [[SpareTimeCategoryButton alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    button.backgroundColor = [UIColor clearColor];
    button.tag = tag;
    [button setButtonClicked:NO];
    
    [self.buttonView addSubview:button];
    [self.buttonView bringSubviewToFront:button];
    
    self.buttonName = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    self.buttonName.text = iconName;
    self.buttonName.tag = 18;
    self.buttonName.hidden = YES;
    self.buttonName.textAlignment = NSTextAlignmentCenter;
    self.buttonName.textColor = [UIColor whiteColor];
    
    [self.buttonView addSubview:self.buttonName];
    
    [button addTarget:self action:@selector(buttonFired:) forControlEvents:UIControlEventTouchUpInside];
    [self.mainScreenViewController.view addSubview:self.buttonView];
    
}
-(void)drawClockWith:(CGRect)rect withIcon:(NSString *)iconName{
    self.buttonView = [[UIView alloc] initWithFrame:rect];
    self.buttonView.clipsToBounds = YES;
    self.buttonView.layer.cornerRadius = self.buttonView.frame.size.height/2.0f;
    self.buttonView.backgroundColor = [UIColor whiteColor];
    [self.mainScreenViewController.view addSubview: self.buttonView];
    
    self.buttonIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    self.buttonIcon.tag = 17;
    self.buttonIcon.clipsToBounds = YES;
    self.buttonIcon.contentMode = UIViewContentModeCenter;
    
    [self.buttonIcon setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png", iconName]]];
    [self.buttonView addSubview:self.buttonIcon];
    
    SpareTimeCategoryButton *button = [[SpareTimeCategoryButton alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    button.backgroundColor = [UIColor clearColor];
    [button setButtonClicked:NO];
    
    [self.buttonView addSubview:button];
    [self.buttonView bringSubviewToFront:button];
    [button addTarget:self action:@selector(clockFired) forControlEvents:UIControlEventTouchUpInside];
}
- (void)clockFired{
    NSLog(@"clock");
    [UIView animateWithDuration:1.4 animations:^{
        
        self.background.frame = CGRectMake(-240, 0, 960, self.view.frame.size.height);
        self.mainScreenViewController.view.frame = CGRectMake(-340, 0, 960, self.view.frame.size.height);    }];
    
    [UIView animateWithDuration:0.4 animations:^{
        self.mainScreenViewController.view.alpha = 0.0;
    }];
}


@end
