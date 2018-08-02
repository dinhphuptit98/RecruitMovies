//
//  MoviesListViewController.m
//  RecruitMovies
//
//  Created by RTC-HN156 on 7/31/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.


#import "MoviesListViewController.h"
#import "MovieViewCell.h"
#import "MovieCollectionViewCell.h"

#import "SelectedMovieViewController.h"

#import "Movie.h"
#import "Constant.h"
#import "RecruitMoviesFetcherManager.h"
@interface MoviesListViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuItem;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *viewCollectionBt;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *changeDisplay;
@end

@implementation MoviesListViewController

int numberCheck = 1;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MovieCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionCell"];
    [self.tableView reloadData];
    [self.collectionView reloadData];
    [RecruitMoviesFetcherManager getDataMovie:MoviePopular :1];
    

}

//UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 150;
}
//hien thi cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MovieViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SelectedMovieViewController *showMovieVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SelectedMovieController"];
    [[self navigationController] pushViewController:showMovieVC animated:YES];
    
}

//UICollectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MovieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(180, 210);
}
// Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
     SelectedMovieViewController *movieVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SelectedMovieController"];
     [[self navigationController] pushViewController:movieVC animated:YES];
 return YES;
 }

// button change TableView to CollectionView
- (IBAction)changeView:(id)sender {
    numberCheck = -numberCheck;
    if (numberCheck == -1){
        self.changeDisplay.image = [UIImage imageNamed:@"ic_view_list"];
        self.tableView.hidden = YES;
        self.collectionView.hidden = NO;
    }
    if (numberCheck == 1){
        self.changeDisplay.image = [UIImage imageNamed:@"ic_view_module"];
        self.tableView.hidden = NO;
        self.collectionView.hidden = YES;
    }
    
}

//button open Menu and close Menu
- (IBAction)menuBt:(UIBarButtonItem *)sender {
    numberCheck = -numberCheck;
   
}




@end
