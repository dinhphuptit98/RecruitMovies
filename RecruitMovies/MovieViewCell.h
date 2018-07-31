//
//  MovieViewCell.h
//  RecruitMovies
//
//  Created by RTC-HN156 on 7/31/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageMovie;
@property (weak, nonatomic) IBOutlet UILabel *nameMovie;
@property (weak, nonatomic) IBOutlet UILabel *timeMovie;
@property (weak, nonatomic) IBOutlet UILabel *rateMovie;
@property (weak, nonatomic) IBOutlet UILabel *overViewMovie;
@property (weak, nonatomic) IBOutlet UIImageView *adult;
@property (weak, nonatomic) IBOutlet UIButton *starBt;
- (IBAction)starSelected:(id)sender;

@end
