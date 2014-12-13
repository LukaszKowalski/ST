//
//  SideBarContent.h
//  SpareTime
//
//  Created by Łukasz Kowalski on 08/12/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SideBarContent : NSObject

@property (strong, nonatomic) NSString *currentCategory;

+ (SideBarContent *)sharedInstance;   // class method to return the singleton object
- (void)sideBarCategory:(NSString *)categoryName;
- (NSString *)getSideBarCategory;

@end
