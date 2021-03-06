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
+ (void) getDataMovie:(NSString *)URLlink pageNumber:(NSInteger) pageNumber blockSuccess:(void(^)(NSMutableArray *resultMovies))blockSuccess blockFailure:(void(^)(NSError *error))blockFailure;
+ (void) getDataDetailMovie:(NSString *)URLlink blockSuccess:(void(^)(Movie *movie))blockSuccess blockFailure:(void(^)(NSError *error))blockFailure;
+ (void) getDataSearchMovie:(NSString *)URLlink blockSuccess:(void(^)(NSMutableArray *resultMovies))blockSuccess blockFailure:(void(^)(NSError *error))blockFailure;
@end
