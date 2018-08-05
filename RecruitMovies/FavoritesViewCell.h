//
//  FavoritesViewCell.h
//  RecruitMovies
//
//  Created by Admin on 8/2/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoritesViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photoFavoriteMovie;
@property (weak, nonatomic) IBOutlet UILabel *nameFavoriteMovie;
@property (weak, nonatomic) IBOutlet UILabel *dateFavoriteMovie;
@property (weak, nonatomic) IBOutlet UILabel *ratingFavoriteMovie;
@property (weak, nonatomic) IBOutlet UILabel *overViewFavoriteMovie;


@end
