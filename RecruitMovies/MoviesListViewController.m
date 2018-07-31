//
//  MoviesListViewController.m
//  RecruitMovies
//
//  Created by RTC-HN156 on 7/31/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "MoviesListViewController.h"
#import "MovieViewCell.h"
#import "MovieCollectionViewCell.h"
#import "SelectedMovieViewController.h"
#import "SlideMenuViewController.h"
@interface MoviesListViewController ()
@property (weak, nonatomic) IBOutlet UIButton *closeMenu;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingMenuView;
@property (weak, nonatomic) IBOutlet UIView *slideMenuView;
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SelectedMovieViewController *movieVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SelectedMovieController"];
    [[self navigationController] pushViewController:movieVC animated:YES];
}

//UICollectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    
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

// button change View
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
- (IBAction)menuBt:(UIBarButtonItem *)sender {
    numberCheck = -numberCheck;
    if (numberCheck == -1){
        self.leadingMenuView.constant = 0;
        self.closeMenu.hidden = NO;
    }
    if (numberCheck == 1){
        self.leadingMenuView.constant = -340;
        self.closeMenu.hidden = YES;
    }
    
}
- (IBAction)closeMenu:(id)sender {
    self.leadingMenuView.constant = -340;
    self.closeMenu.hidden = YES;
}


@end
