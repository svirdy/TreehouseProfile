//
//  BadgeInfo.h
//  TreehouseProfile
//
//  Created by Sachin Virdy on 10/13/15.
//  Copyright © 2015 Sachin Virdy. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface BadgeInfo : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) NSString *icon_url;
@property (strong, nonatomic) NSString *earnedDate;

-(id) initWithName:(NSString *)name;
+(id) badgeWithName:(NSString *)name;

-(NSURL *) icon_url_link;
@end
