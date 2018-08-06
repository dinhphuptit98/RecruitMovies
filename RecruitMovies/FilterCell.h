//
//  FilterCell.h
//  RecruitMovies
//
//  Created by PhuND12 on 8/6/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FilterCellDelegate <NSObject>
-(void)didSelectedRatingAt: (NSIndexPath*) indexPath with: (bool) isLike andWith:(NSString*) numberOfPage;
@end
@interface FilterCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameMovieFilter;
@property (weak, nonatomic) IBOutlet UITextField *numberPage;
@property (nonatomic, assign) NSIndexPath *indexPath;
@property (weak, nonatomic) IBOutlet UIButton *checkedMovie;
@property (nonatomic, weak) id<FilterCellDelegate> delegate;
- (IBAction)checkedMovies:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *numberOfPage;
@end
