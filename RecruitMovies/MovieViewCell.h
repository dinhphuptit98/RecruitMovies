//
//  MovieViewCell.h
//  RecruitMovies
//
//  Created by RTC-HN156 on 7/31/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MovieViewCellDelegate <NSObject>
-(void)didSelectedRatingAt: (NSIndexPath*) indexPath with: (bool) isLike;
@end
@interface MovieViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageMovie;
@property (assign, nonatomic) IBOutlet UILabel *nameMovieLabel;
@property (assign, nonatomic) IBOutlet UILabel *timeMovie;
@property (assign, nonatomic) IBOutlet UILabel *rateMovie;
@property (assign, nonatomic) IBOutlet UILabel *overViewMovie;
@property (weak, nonatomic) IBOutlet UIImageView *adult;
@property (weak, nonatomic) IBOutlet UIButton *starBt;
@property (nonatomic, assign) NSIndexPath *indexPath;
- (IBAction)starSelected:(id)sender;
@property (nonatomic, weak) id<MovieViewCellDelegate> delegate;
@end
