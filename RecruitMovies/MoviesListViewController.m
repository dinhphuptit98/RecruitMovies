//
//  MoviesListViewController.m
//  RecruitMovies
//
//  Created by RTC-HN156 on 7/31/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.


#import "MoviesListViewController.h"
#import "MovieCollectionViewCell.h"
#import "SelectedMovieViewController.h"
#import "FavoriteMoviesViewController.h"
#import "Constant.h"
#import "RecruitMoviesFetcherManager.h"
#import <SWRevealViewController.h>
#import "MovieViewCell.h"
#import "Movie.h"
#import "CoreDataHelper.h"
#import "MovieFavorite+CoreDataClass.h"
#import "SVPullToRefresh.h"
@interface MoviesListViewController () <UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,MovieViewCellDelegate,SWRevealViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuItem;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *viewCollectionBt;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *changeDisplay;

@end

@implementation MoviesListViewController

int numberCheck = 1 ;

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak MoviesListViewController *weakSelf= self;

    //SWRevealViewController.h
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    self.revealViewController.delegate = self;
    self.menuItem.target = self.revealViewController;
    self.menuItem.action = @selector(revealToggle: );
    self.revealViewController.rearViewRevealWidth = self.view.frame.size.width - 50;
    
    //tableView and CollectionView
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieViewCell" bundle:nil] forCellReuseIdentifier:@"MovieViewCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MovieCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"MovieCollectionViewCell"];
    
    // SVPullToFresh
    // setup pull-to-refresh
    [self.tableView addPullToRefreshWithActionHandler:^{
        
    }];
    
    // setup infinite scrolling
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        
    }];
    
    //    getDataMoviePopular
    self.arrMoviePopular = [[NSMutableArray  alloc] init];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        [RecruitMoviesFetcherManager getDataMovie:MoviePopular pageNumber:2 blockSuccess:^(NSMutableArray *resultMovies) {
            dispatch_async(dispatch_get_main_queue(), ^(void){
                weakSelf.arrMoviePopular = resultMovies;
                [weakSelf.tableView reloadData];
                [weakSelf.collectionView reloadData];
            });
        } blockFailure:^(NSError *error) {
        }];
    });
}
//UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrMoviePopular.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
//hien thi cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieViewCell" forIndexPath:indexPath];
    cell.nameMovieLabel.text = [NSString stringWithFormat:@"%@",[self.arrMoviePopular[indexPath.row] nameMovie]];
    cell.timeMovie.text = [NSString stringWithFormat:@"%@",[self.arrMoviePopular[indexPath.row] dateMovie]];
    cell.rateMovie.text = [NSString stringWithFormat:@"%.1f%@",[self.arrMoviePopular[indexPath.row] rating],@"/10"];
    cell.overViewMovie.text = [NSString stringWithFormat:@"%@",[self.arrMoviePopular[indexPath.row] overView]];
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString *url = [NSString stringWithFormat:@"http://image.tmdb.org/t/p/w780/%@",[self.arrMoviePopular[indexPath.row] URLImage]];
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
        dispatch_async(dispatch_get_main_queue(), ^{
            // WARNING: is the cell still using the same data by this point??
            cell.imageMovie.image = [UIImage imageWithData: data];
        });
    });
    [cell.starBt setSelected:[self.arrMoviePopular[indexPath.row] isFavorite]];
    cell.delegate = self;
    cell.indexPath = indexPath;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SelectedMovieViewController *showMovieVC;
    showMovieVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SelectedMovieController"];
    showMovieVC.idMovie = [self.arrMoviePopular[indexPath.row] idMovie];
    showMovieVC.check = [self.arrMoviePopular[indexPath.row] isFavorite];
    
    [[self navigationController] pushViewController:showMovieVC animated:YES];
    
    
}

// delegate button star trong CEll
- (void)didSelectedRatingAt:(NSIndexPath *)indexPath with:(bool)isLike {
    NSString *nameMovieFavorite = [self.arrMoviePopular[indexPath.row] nameMovie];
    if (isLike) {
        // luu cai ten movie tai indexPath vao coredata
        [CoreDataHelper.shared innsert:nameMovieFavorite];
    } else {
        // xoa cai ten movie tai indexPath vao coredata
        [CoreDataHelper.shared deleteWith:nameMovieFavorite];
    }
   
}

//UICollectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrMoviePopular.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MovieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MovieCollectionViewCell" forIndexPath:indexPath];
    cell.nameMovieLabel.text = [NSString stringWithFormat:@"%@",[self.arrMoviePopular[indexPath.item] nameMovie]];;
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString *url = [NSString stringWithFormat:@"http://image.tmdb.org/t/p/w780/%@",[self.arrMoviePopular[indexPath.row] URLImage]];
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
        dispatch_async(dispatch_get_main_queue(), ^{
            // WARNING: is the cell still using the same data by this point??
            cell.photoMovie.image = [UIImage imageWithData: data];
        });
    });
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(180, 210);
}
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SelectedMovieViewController *showMovieVC;
    showMovieVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SelectedMovieController"];
    showMovieVC.idMovie = [self.arrMoviePopular[indexPath.row] idMovie];
    showMovieVC.check = [self.arrMoviePopular[indexPath.row] isFavorite];
    [[self navigationController] pushViewController:showMovieVC animated:YES];
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

@end
