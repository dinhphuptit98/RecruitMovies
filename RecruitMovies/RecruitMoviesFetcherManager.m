//
//  RecruitMoviesFetcherManager.m
//  RecruitMovies
//
//  Created by PhuND12 on 8/2/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "RecruitMoviesFetcherManager.h"
#import "CoreDataHelper.h"

@implementation RecruitMoviesFetcherManager

//get data List Movie
+ (void) getDataMovie:(NSString *)URLlink pageNumber:(NSInteger) pageNumber blockSuccess:(void(^)(NSMutableArray *resultMovies))blockSuccess blockFailure:(void(^)(NSError *error))blockFailure{
    
    NSMutableArray<Movie*> *arrMovie = [[NSMutableArray  alloc] init];
    
    NSString *urlString = [NSString stringWithFormat:@"%@%d",URLlink,(int)pageNumber];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    AFSecurityPolicy* policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    [policy setValidatesDomainName:NO];
    [policy setAllowInvalidCertificates:YES];
    NSURLSessionDataTask *dataTask = [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *object = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:NULL];
        NSArray *results = object[@"results"];
        
        NSMutableArray *moviesFav = [CoreDataHelper.shared getFavoriteMovies];
        
        for(int i=0;i<results.count;i++){
            Movie *movie = [[Movie alloc] init];
            movie.idMovie = (NSInteger)[results[i] valueForKey:@"id"];
            movie.nameMovie = [results[i] valueForKey:@"title"];
            movie.dateMovie = [results[i] valueForKey:@"release_date"];
            movie.rating = [[results[i] valueForKey:@"vote_average"] doubleValue];
            movie.overView = [results[i] valueForKey:@"overview"];
            movie.URLImage = [results[i] valueForKey:@"poster_path"];
            movie.adult = (NSInteger)[results valueForKey:@"adult"];
            movie.isFavorite = [moviesFav containsObject:movie.nameMovie];
            [arrMovie addObject:movie];
        }
        blockSuccess(arrMovie);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        blockFailure(error);
    }];
    [dataTask resume];
}


//get data Show Movie
+ (void) getDataDetailMovie:(NSString *)URLlink blockSuccess:(void(^)(Movie *movie))blockSuccess blockFailure:(void(^)(NSError *error))blockFailure{
    
    NSString *urlString = [NSString stringWithFormat:@"%@",URLlink];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    AFSecurityPolicy* policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    [policy setValidatesDomainName:NO];
    [policy setAllowInvalidCertificates:YES];
    NSURLSessionDataTask *dataTask = [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *object = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:NULL];
        
            Movie *movie = [[Movie alloc] init];
            movie.idMovie = (NSInteger)[object valueForKey:@"id"];
            movie.nameMovie = [object valueForKey:@"title"];
            movie.dateMovie = [object valueForKey:@"release_date"];
            movie.rating = [[object valueForKey:@"vote_average"] doubleValue];
            movie.overView = [object valueForKey:@"overview"];
            movie.URLImage = [object valueForKey:@"poster_path"];
            movie.adult = (NSInteger)[object valueForKey:@"adult"];
        
        blockSuccess(movie);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"FAILD====%@", error);
        blockFailure(error);
    }];
    [dataTask resume];
}
@end
