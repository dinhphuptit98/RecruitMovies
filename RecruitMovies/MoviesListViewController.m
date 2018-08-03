//
//  MoviesListViewController.m
//  RecruitMovies
//
//  Created by RTC-HN156 on 7/31/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.


#import "MoviesListViewController.h"
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
@property (strong, nonatomic)  NSMutableArray *arrMoviePopular;
@end

@implementation MoviesListViewController

int numberCheck = 1;

- (void)viewDidLoad {
    [super viewDidLoad];
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
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MovieCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionCell"];

    
//    getData
    self.arrMoviePopular = [[NSMutableArray  alloc] init];
    __weak MoviesListViewController *weakSelf= self;
    [RecruitMoviesFetcherManager getDataMovie:MoviePopular pageNumber:1 blockSuccess:^(NSMutableArray *resultMovies) {
            weakSelf.arrMoviePopular = resultMovies;
        [self.tableView reloadData];
        [self.collectionView reloadData];
    } blockFailure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    NSLog(@"%@",self.arrMoviePopular);
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
    
    MovieViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.nameMovie.text = [NSString stringWithFormat:@"%@",[self.arrMoviePopular[indexPath.row] nameMovie]];
    cell.timeMovie.text = [NSString stringWithFormat:@"%@",[self.arrMoviePopular[indexPath.row] dateMovie]];
    cell.rateMovie.text = [NSString stringWithFormat:@"%.1f%@",[self.arrMoviePopular[indexPath.row] rating],@"/10"];
    cell.overViewMovie.text = [NSString stringWithFormat:@"%@",[self.arrMoviePopular[indexPath.row] overView]];
    if ([self.arrMoviePopular[indexPath.row] check] == 1){
        cell.starBt.selected = false;
    }
    if ([self.arrMoviePopular[indexPath.row] check] == -1){
        cell.starBt.selected = true;
    }
    cell.delegate = self;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SelectedMovieViewController *showMovieVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SelectedMovieController"];
    [[self navigationController] pushViewController:showMovieVC animated:YES];
    NSLog(@"%d",[self.arrMoviePopular[indexPath.row] idMovie]);

    
}
// delegate button star trong CEll
- (void)setIndex:(NSInteger )index {

}

//UICollectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrMoviePopular.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MovieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    cell.nameMovie.text = [NSString stringWithFormat:@"%@",[self.arrMoviePopular[indexPath.item] nameMovie]];;
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
     NSLog(@"%d",[self.arrMoviePopular[indexPath.row] idMovie]);
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
    

}




@end
