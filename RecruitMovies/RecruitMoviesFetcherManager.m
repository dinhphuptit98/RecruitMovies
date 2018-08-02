//
//  RecruitMoviesFetcherManager.m
//  RecruitMovies
//
//  Created by PhuND12 on 8/2/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "RecruitMoviesFetcherManager.h"


@implementation RecruitMoviesFetcherManager
+ (Movie *) getDataMovie:(NSString *)URLlink :(NSInteger) pageNumber {
    Movie *movie;
    
    NSString *urlString = [NSString stringWithFormat:@"%@%ld",URLlink,(long)pageNumber];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    AFSecurityPolicy* policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    [policy setValidatesDomainName:NO];
    [policy setAllowInvalidCertificates:YES];
    

    NSURLSessionDataTask *dataTask = [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"REPOSEN=====%@", responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"FAILD====%@", error);
    }];
    [dataTask resume];
    return movie;
}
@end
