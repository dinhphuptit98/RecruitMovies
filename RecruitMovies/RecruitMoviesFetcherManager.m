//
//  RecruitMoviesFetcherManager.m
//  RecruitMovies
//
//  Created by PhuND12 on 8/2/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "RecruitMoviesFetcherManager.h"


@implementation RecruitMoviesFetcherManager
-(Movie *) getDataMovie:(NSString *)URLlink :(NSInteger) pageNumber {
    Movie *movie;
    
    NSString *urlString = [NSString stringWithFormat:@"%@%ld",URLlink,(long)pageNumber];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    AFSecurityPolicy* policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    [policy setValidatesDomainName:NO];
    [policy setAllowInvalidCertificates:YES];
    
    [manager POST:urlString parameters:nil progress:nil success:^(NSURLSessionTask *task,id responseObject){
        NSLog(@"%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
    } failure:^(NSURLSessionTask *task, NSError *error){
        NSLog(@"%@",error);
    }];
    return movie;
}
@end
