//
//  FilterCell.m
//  RecruitMovies
//
//  Created by PhuND12 on 8/6/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "FilterCell.h"

@implementation FilterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}
- (IBAction)checkedMovies:(UIButton *)sender {
    [sender setSelected: !sender.selected];
    [self.delegate didSelectedRatingAt:self.indexPath with:sender.selected andWith:self.numberPage.text];
}

@end
