//
//  FilterCell.h
//  RecruitMovies
//
//  Created by PhuND12 on 8/6/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameMovieFilter;
@property (weak, nonatomic) IBOutlet UITextField *numberPage;
@property (weak, nonatomic) IBOutlet UIImageView *checkedFilter;

@end
