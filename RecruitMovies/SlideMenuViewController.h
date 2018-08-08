//
//  SlideMenuViewController.h
//  RecruitMovies
//
//  Created by Admin on 8/3/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
@interface SlideMenuViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *photoUser;
@property (weak, nonatomic) IBOutlet UILabel *nameUser;
@property (weak, nonatomic) IBOutlet UILabel *emailUser;
@property (weak, nonatomic) IBOutlet UILabel *sexUser;
@property (weak, nonatomic) IBOutlet UILabel *dateUser;
@property (strong, nonatomic) NSMutableArray *moviesRemider;
@property (strong, nonatomic) NSMutableArray *allMoviesPopular;

@end
