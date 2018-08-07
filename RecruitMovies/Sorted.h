//
//  Sorted.h
//  RecruitMovies
//
//  Created by PhuND12 on 8/7/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sorted : NSObject
- (NSMutableArray<Movie *>*)sortedRating:(NSMutableArray<Movie *>*)sortedArrayRating;
- (NSMutableArray<Movie *>*)sortedDate:(NSMutableArray<Movie *>*)sortedArrayDate;
@end
