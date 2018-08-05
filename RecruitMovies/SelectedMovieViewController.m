//
//  SelectedMovieViewController.m
//  RecruitMovies
//
//  Created by Admin on 7/31/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "SelectedMovieViewController.h"
#import "Movie.h"
#import "RecruitMoviesFetcherManager.h"
@interface SelectedMovieViewController ()
@property (strong, nonatomic)  Movie *movieDetail;
@property (weak, nonatomic) IBOutlet UILabel *dateMovieDetail;
@property (weak, nonatomic) IBOutlet UILabel *ratingMovieDetail;
@property (weak, nonatomic) IBOutlet UIButton *like;
@property (weak, nonatomic) IBOutlet UIImageView *photoMovieDetail;
@property (weak, nonatomic) IBOutlet UILabel *overMovieDetail;
@end

@implementation SelectedMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
