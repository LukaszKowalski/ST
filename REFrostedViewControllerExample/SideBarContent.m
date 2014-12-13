//
//  SideBarContent.m
//  SpareTime
//
//  Created by Łukasz Kowalski on 08/12/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "SideBarContent.h"

@implementation SideBarContent

static SideBarContent *sharedBarInstance = nil;    // static instance variable

+ (SideBarContent *)sharedInstance {
    if (sharedBarInstance == nil) {
        sharedBarInstance = [[super allocWithZone:NULL] init];
    }
    return sharedBarInstance;
}

- (id)init {
    if ( (self = [super init]) ) {
        // your custom initialization
    }
    return self;
}
- (void)sideBarCategory:(NSString *)categoryName{
    self.currentCategory = categoryName;
    NSLog(@"singleton category = %@", self.currentCategory);
}

- (NSString *)getSideBarCategory{
    return self.currentCategory;
}


@end
