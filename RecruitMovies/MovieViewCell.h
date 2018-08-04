//
//  MovieViewCell.h
//  RecruitMovies
//
//  Created by RTC-HN156 on 7/31/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MovieViewCellDelegate <NSObject>
-(void)setIndex:(NSInteger)index ;
@end
@interface MovieViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageMovie;
@property (assign, nonatomic) IBOutlet UILabel *nameMovie;
@property (assign, nonatomic) IBOutlet UILabel *timeMovie;
@property (assign, nonatomic) IBOutlet UILabel *rateMovie;
@property (assign, nonatomic) IBOutlet UILabel *overViewMovie;
@property (weak, nonatomic) IBOutlet UIImageView *adult;
@property (weak, nonatomic) IBOutlet UIButton *starBt;
- (IBAction)starSelected:(id)sender;
@property (nonatomic, weak) id<MovieViewCellDelegate> delegate;
@end
