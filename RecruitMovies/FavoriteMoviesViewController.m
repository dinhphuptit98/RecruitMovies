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

@interface FavoriteMoviesViewController () <UITableViewDelegate,UITableViewDataSource,SWRevealViewControllerDelegate,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuItem;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong,nonatomic) NSMutableArray *arrSearchMovie;
@end

@implementation FavoriteMoviesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.revealViewController.delegate = self;
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    self.menuItem.target = self.revealViewController;
    self.menuItem.action = @selector(revealToggle:);
    [self.tableView registerNib:[UINib nibWithNibName:@"FavoritesViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    self.searchBar.delegate = self;
    
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
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    self.arrSearchMovie = [[NSMutableArray alloc]init];
    searchText = [searchText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([searchText isEqualToString:@""] || (searchText == nil) || (searchText.length == 0)){
        self.arrSearchMovie = self.moviesFavorite;
    }else{
        for (Movie *movie in self.moviesFavorite){
            if ([movie.nameMovie containsString:searchText]){
                [self.arrSearchMovie addObject:movie];
            }
        }
    }
    [self.tableView reloadData];
}
//Table View
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.arrSearchMovie.count != 0) {
        return self.arrSearchMovie.count;
        
    } else {
        return self.moviesFavorite.count;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FavoritesViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (self.arrSearchMovie.count != 0) {
        cell.nameFavoriteMovie.text = [self.arrSearchMovie[indexPath.row] nameMovie];
        cell.dateFavoriteMovie.text = [self.arrSearchMovie[indexPath.row] dateMovie];
        cell.ratingFavoriteMovie.text = [NSString stringWithFormat:@"%.1f",[self.arrSearchMovie[indexPath.row] rating]];
        cell.overViewFavoriteMovie.text = [self.arrSearchMovie[indexPath.row] overView];
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSString *url = [NSString stringWithFormat:@"http://image.tmdb.org/t/p/w780/%@",[self.arrSearchMovie[indexPath.row] URLImage]];
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
            dispatch_async(dispatch_get_main_queue(), ^{
                cell.photoFavoriteMovie.image = [UIImage imageWithData: data];
            });
        });
        
        
    } else {
        cell.nameFavoriteMovie.text = [self.moviesFavorite[indexPath.row] nameMovie];
        cell.dateFavoriteMovie.text = [self.moviesFavorite[indexPath.row] dateMovie];
        cell.ratingFavoriteMovie.text = [NSString stringWithFormat:@"%.1f",[self.moviesFavorite[indexPath.row] rating]];
        cell.overViewFavoriteMovie.text = [self.moviesFavorite[indexPath.row] overView];
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSString *url = [NSString stringWithFormat:@"http://image.tmdb.org/t/p/w780/%@",[self.moviesFavorite[indexPath.row] URLImage]];
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
            dispatch_async(dispatch_get_main_queue(), ^{
                cell.photoFavoriteMovie.image = [UIImage imageWithData: data];
            });
        });
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [CoreDataHelper.shared deleteFavoriteWith:[self.moviesFavorite[indexPath.row] nameMovie]];
        [self.moviesFavorite removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
        
    }
    
}
@end
