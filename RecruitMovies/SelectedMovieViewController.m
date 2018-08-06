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
    NSString *urlDetail = [NSString stringWithFormat:@"http://api.themoviedb.org/3/movie/%@?api_key=e7631ffcb8e766993e5ec0c1f4245f93",self.idMovie];
    self.movieDetail = [[Movie  alloc] init];
    [RecruitMoviesFetcherManager getDataDetailMovie:urlDetail blockSuccess:^(Movie *movie){
        self.movieDetail = movie;
        self.dateMovieDetail.text = self.movieDetail.dateMovie;
        self.ratingMovieDetail.text = [NSString stringWithFormat:@"%.1f",[self.movieDetail rating]];
        self.overMovieDetail.text = self.movieDetail.overView;
        NSString *url = [NSString stringWithFormat:@"http://image.tmdb.org/t/p/w780/%@",[self.movieDetail URLImage]];
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
        self.photoMovieDetail.image = [UIImage imageWithData: data];
    } blockFailure:^(NSError *error){
    }];
    
    // hien thi nhan vat trong phim
    NSString *urlCharacter = [NSString stringWithFormat:@"api.themoviedb.org/3/movie/%@/credits?api_key=e7631ffcb8e766993e5ec0c1f4245f93",self.idMovie];
    self.arrCharacter = [[NSMutableArray  alloc] init];
    __weak SelectedMovieViewController *weakSelf= self;
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        [CharacterManager getDataCharacter:urlCharacter blockSuccess:^(NSMutableArray *resultCharacter) {
            dispatch_async(dispatch_get_main_queue(), ^(void){
                weakSelf.arrCharacter = resultCharacter;
                NSLog(@"%@",_arrCharacter);
                [self.collectionView reloadData];
            });
        } blockFailure:^(NSError *error) {
            NSLog(@"%@",error);
        }];
    });
}


//UICollectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrCharacter.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ActorAndActressCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ActorAndActressCell" forIndexPath:indexPath];
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
    return CGSizeMake(50, 80);
}





@end
