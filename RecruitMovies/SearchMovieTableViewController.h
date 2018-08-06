//
//  SearchMovieTableViewController.h
//  RecruitMovies
//
//  Created by Admin on 8/6/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchMovieTableViewController : UITableViewController
@property (strong,nonatomic) NSString *urlDetail;
@property (assign,nonatomic) float ratingCheck;
@property (strong,nonatomic) NSString *dateCheck;
@property (assign,nonatomic) bool checkedSorted;
@property (strong, nonatomic)  NSMutableArray *arrMovieSearch;
@end
