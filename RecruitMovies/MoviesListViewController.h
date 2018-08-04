//
//  MoviesListViewController.h
//  RecruitMovies
//
//  Created by RTC-HN156 on 7/31/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SWRevealViewController.h>
#import "MovieViewCell.h"

@interface MoviesListViewController : UIViewController  <UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,MovieViewCellDelegate,SWRevealViewControllerDelegate>

@end
