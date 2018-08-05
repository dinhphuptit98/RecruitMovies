//
//  FavoriteMoviesViewController.m
//  RecruitMovies
//
//  Created by RTC-HN156 on 7/31/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "FavoriteMoviesViewController.h"
#import <CoreData/CoreData.h>
#import <SWRevealViewController.h>
#import "FavoritesViewCell.h"
@interface FavoriteMoviesViewController () <UITableViewDelegate,UITableViewDataSource,SWRevealViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuItem;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FavoriteMoviesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.revealViewController.delegate = self;
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    self.menuItem.target = self.revealViewController;
    self.menuItem.action = @selector(revealToggle:);
    [self.tableView registerNib:[UINib nibWithNibName:@"FavoritesViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    [self.tableView reloadData];
    
}


//Table View
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FavoritesViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        //add code here for when you hit delete
//        [self.myListItems removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//        [self saveList];
    }

}
@end
