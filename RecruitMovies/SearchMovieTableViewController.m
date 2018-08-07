//
//  SearchMovieTableViewController.m
//  RecruitMovies
//
//  Created by Admin on 8/6/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "SearchMovieTableViewController.h"
#import "MovieViewCell.h"
#import "Movie.h"
#import "RecruitMoviesFetcherManager.h"
#import "Sorted.h"
@interface SearchMovieTableViewController ()

@end

@implementation SearchMovieTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    
    //    getDataSearchMovie
    self.arrMovieSearch = [[NSMutableArray  alloc] init];
    __weak SearchMovieTableViewController *weakSelf= self;
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        [RecruitMoviesFetcherManager getDataSearchMovie:self.urlDetail blockSuccess:^(NSMutableArray *resultMovies) {
            dispatch_async(dispatch_get_main_queue(), ^(void){
                for (Movie *i in resultMovies){
                    if (i.rating > self.ratingCheck && [i.dateMovie integerValue] > [self.dateCheck integerValue]){
                        [weakSelf.arrMovieSearch addObject:i];
                    }
                }
                if (self.checkedSorted == true){
                    
                }else{
                    
                }
                [weakSelf.tableView reloadData];
            });
        } blockFailure:^(NSError *error) {
        }];
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrMovieSearch.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
//hien thi cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell1;
    MovieViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell1 = cell;
    cell.nameMovieLabel.text = [NSString stringWithFormat:@"%@",[self.arrMovieSearch[indexPath.row] nameMovie]];
    cell.timeMovie.text = [NSString stringWithFormat:@"%@",[self.arrMovieSearch[indexPath.row] dateMovie]];
    cell.rateMovie.text = [NSString stringWithFormat:@"%.1f%@",[self.arrMovieSearch[indexPath.row] rating],@"/10"];
    cell.overViewMovie.text = [NSString stringWithFormat:@"%@",[self.arrMovieSearch[indexPath.row] overView]];
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString *url = [NSString stringWithFormat:@"http://image.tmdb.org/t/p/w780/%@",[self.arrMovieSearch[indexPath.row] URLImage]];
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
        dispatch_async(dispatch_get_main_queue(), ^{
            // WARNING: is the cell still using the same data by this point??
            cell.imageMovie.image = [UIImage imageWithData: data];
        });
    });
    [cell.starBt setSelected:[self.arrMovieSearch[indexPath.row] isFavorite]];
    return cell;
}


@end
