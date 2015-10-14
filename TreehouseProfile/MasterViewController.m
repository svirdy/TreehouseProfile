//
//  MasterViewController.m
//  TreehouseProfile
//
//  Created by Sachin Virdy on 10/13/15.
//  Copyright © 2015 Sachin Virdy. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "BadgeInfo.h"


@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
    NSURL *profileURL = [NSURL URLWithString:@"http://teamtreehouse.com/sachinvirdy.json"];
    NSData *jsonData = [NSData dataWithContentsOfURL:profileURL];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    NSLog(@"%@", dataDictionary);
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    self.badges = [NSMutableArray array];
    
    NSArray *badgesArray = [dataDictionary objectForKey:@"badges"];
    
    for (NSDictionary *badgesDictionary in badgesArray) {
        BadgeInfo *badge = [BadgeInfo badgeWithName:[badgesDictionary objectForKey:@"name"]];
        badge.earnedDate = [badgesDictionary objectForKey:@"earned_date"];
        badge.icon_url = [badgesDictionary objectForKey:@"icon_url"];
        badge.url = [badgesDictionary objectForKey:@"url"];
        [self.badges addObject:badge];
    }
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.badges.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    BadgeInfo *badge = [self.badges objectAtIndex:indexPath.row];
    
    NSData *iconData = [NSData dataWithContentsOfURL:badge.icon_url_link];
    UIImage *icon = [UIImage imageWithData:iconData];
    cell.imageView.image = icon;
    cell.textLabel.text = badge.name;
    cell.detailTextLabel.text = badge.earnedDate;
    return cell;
}


@end
