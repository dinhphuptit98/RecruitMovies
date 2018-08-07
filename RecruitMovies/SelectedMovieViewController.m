//
//  SelectedMovieViewController.m
//  RecruitMovies
//
//  Created by Admin on 7/31/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "SelectedMovieViewController.h"
#import "Movie.h"
#import "CharacterManager.h"
#import "RecruitMoviesFetcherManager.h"
#import "ActorAndActressCell.h"
#import "SlideMenuViewController.h"
#import "CoreDataHelper.h"
@interface SelectedMovieViewController () <UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic)  Movie *movieDetail;
@property (weak, nonatomic) IBOutlet UILabel *dateMovieDetail;
@property (weak, nonatomic) IBOutlet UILabel *ratingMovieDetail;
@property (weak, nonatomic) IBOutlet UIButton *like;
@property (weak, nonatomic) IBOutlet UIImageView *photoMovieDetail;
@property (weak, nonatomic) IBOutlet UILabel *overMovieDetail;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic)  NSMutableArray *arrCharacter;

@end

@implementation SelectedMovieViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //hien thi movie selected
    if (self.check == true){
        self.like.selected = true;
    }else{
        self.like.selected = false;
    }
    __weak SelectedMovieViewController *weakSelf= self;
    NSString *urlDetail = [NSString stringWithFormat:@"http://api.themoviedb.org/3/movie/%@?api_key=e7631ffcb8e766993e5ec0c1f4245f93",self.idMovie];
    self.movieDetail = [[Movie  alloc] init];
    [RecruitMoviesFetcherManager getDataDetailMovie:urlDetail blockSuccess:^(Movie *movie){
        weakSelf.movieDetail = movie;
        weakSelf.dateMovieDetail.text = weakSelf.movieDetail.dateMovie;
        weakSelf.ratingMovieDetail.text = [NSString stringWithFormat:@"%.1f",[weakSelf.movieDetail rating]];
        weakSelf.overMovieDetail.text = weakSelf.movieDetail.overView;
        NSString *url = [NSString stringWithFormat:@"http://image.tmdb.org/t/p/w780/%@",[weakSelf.movieDetail URLImage]];
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
        weakSelf.photoMovieDetail.image = [UIImage imageWithData: data];
    } blockFailure:^(NSError *error){
    }];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ActorAndActressCell" bundle:nil] forCellWithReuseIdentifier:@"CellCharacter"];
    // hien thi nhan vat trong phim
    NSString *urlCharacter = [NSString stringWithFormat:@"http://api.themoviedb.org/3/movie/%@/credits?api_key=e7631ffcb8e766993e5ec0c1f4245f93",self.idMovie];
    self.arrCharacter = [[NSMutableArray  alloc] init];
    [CharacterManager getDataCharacter:urlCharacter blockSuccess:^(NSMutableArray *resultCharacter) {
        weakSelf.arrCharacter = resultCharacter;
        [weakSelf.collectionView reloadData];
    } blockFailure:^(NSError *error) {
    }];
    
}


//UICollectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrCharacter.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ActorAndActressCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellCharacter" forIndexPath:indexPath];
    cell.nameCharacter.text = [NSString stringWithFormat:@"%@",[self.arrCharacter[indexPath.item] nameCharacter]];;
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString *url = [NSString stringWithFormat:@"http://image.tmdb.org/t/p/w780/%@",[self.arrCharacter[indexPath.row] URLImage]];
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
        dispatch_async(dispatch_get_main_queue(), ^{
            // WARNING: is the cell still using the same data by this point??
            cell.photoCharacter.image = [UIImage imageWithData: data];
        });
    });
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 130);
}

- (IBAction)remider:(UIButton *)sender {
    [sender setSelected: !sender.selected];
    SlideMenuViewController *slideMenuViewController;
    slideMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SlideMenuViewController"];
    
}




@end
