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
#import "CoreDataHelper.h"
#import "MoviesListViewController.h"

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
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.moviesFavorite = [NSMutableArray new];

    UINavigationController *navi = [self.tabBarController viewControllers][0];
    MoviesListViewController * moviesListViewController = [navi viewControllers][0];
    self.allMovies = moviesListViewController.arrMoviePopular;
    
    for (Movie* movie in self.allMovies) {
        if ([[CoreDataHelper.shared getFavoriteMovies] containsObject:movie.nameMovie]) {
            [self.moviesFavorite addObject:movie];
        }
    }
    
     [self.tableView reloadData];
}

//Table View
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.moviesFavorite.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FavoritesViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.nameFavoriteMovie.text = [self.moviesFavorite[indexPath.row] nameMovie];
    cell.dateFavoriteMovie.text = [self.moviesFavorite[indexPath.row] nameMovie];
//    cell.nameFavoriteMovie.text = [self.moviesFavorite[indexPath.row] nameMovie];
//    cell.nameFavoriteMovie.text = [self.moviesFavorite[indexPath.row] nameMovie];
//    cell.nameFavoriteMovie.text = [self.moviesFavorite[indexPath.row] nameMovie];
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
