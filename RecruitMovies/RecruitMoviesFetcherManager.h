//
//  RecruitMoviesFetcherManager.h
//  RecruitMovies
//
//  Created by PhuND12 on 8/2/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "Constant.h"
#import "Movie.h"
@interface RecruitMoviesFetcherManager : NSObject
+ (Movie *) getDataMovie:(NSString *)URLlink :(NSInteger) pageNumber;
@end
