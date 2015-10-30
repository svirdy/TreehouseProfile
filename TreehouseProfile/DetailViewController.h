//
//  DetailViewController.h
//  TreehouseProfile
//
//  Created by Sachin Virdy on 10/13/15.
//  Copyright © 2015 Sachin Virdy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSURL *badgeURL;
@property (strong, nonatomic) id detailItem;

@end

