//
//  Sorted.m
//  RecruitMovies
//
//  Created by PhuND12 on 8/7/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "Sorted.h"
#import "Movie.h"

@implementation Sorted
- (NSMutableArray<Movie *>*)sortedRating:(NSMutableArray<Movie *>*)sortedArrayRating{
    
    return sortedArrayRating;
}
- (NSMutableArray<Movie *>*)sortedDate:(NSMutableArray<Movie *>*)sortedArrayDate{
    for (int i = 0;i<sortedArrayDate.count;i++){
        for (int j = 0 ; j<sortedArrayDate.count;j++){
            if(i != j && [sortedArrayDate[i].dateMovie integerValue]> [sortedArrayDate[j].dateMovie integerValue]){
                [sortedArrayDate removeObjectAtIndex:j];
                [sortedArrayDate insertObject:sortedArrayDate[j] atIndex:0];
            }
        }
    }
    return sortedArrayDate;
}
@end
