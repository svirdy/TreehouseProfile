//
//  BadgeInfo.m
//  TreehouseProfile
//
//  Created by Sachin Virdy on 10/13/15.
//  Copyright © 2015 Sachin Virdy. All rights reserved.
//

#import "BadgeInfo.h"

@implementation BadgeInfo

-(id) initWithName:(NSString *)name {
    self = [super init];
    
    if ( self ) {
        self.name = name;
        self.earnedDate = nil;
        self.icon_url = nil;
    }
    
    return self;
}

+(id) badgeWithName:(NSString *)name {
    return [[self alloc] initWithName:name];
}

-(NSURL *) icon_url_link {
    return [NSURL URLWithString:self.icon_url];
}
-(NSString *) formattedDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    NSDate *date = [dateFormatter dateFromString:self.earnedDate];
    
    [dateFormatter setDateFormat:@"EEEE, MMM dd, yyyy"];
    return [dateFormatter stringFromDate:date];
}

@end
