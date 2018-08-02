//
//  RecruitMoviesFetcherManager.m
//  RecruitMovies
//
//  Created by PhuND12 on 8/2/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "RecruitMoviesFetcherManager.h"


@implementation RecruitMoviesFetcherManager
//get data List Movie
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
        
        NSDictionary *resul = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:NULL];
        NSLog(@"REPOSEN=====%@", resul);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"FAILD====%@", error);
    }];
    [dataTask resume];
    return movie;
}
// get data Movie Detail
+ (Movie *) getDataMovieDetail :(NSInteger) idMovie {
    Movie *movie;
    
    NSString *urlString = [NSString stringWithFormat:@"%@%ld%@",@"api.themoviedb.org/3/movie/",(long)idMovie,@"?api_key=e7631ffcb8e766993e5ec0c1f4245f93"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    AFSecurityPolicy* policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    [policy setValidatesDomainName:NO];
    [policy setAllowInvalidCertificates:YES];
    
    
    NSURLSessionDataTask *dataTask = [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *resul = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:NULL];
        NSLog(@"REPOSEN=====%@", resul);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"FAILD====%@", error);
    }];
    [dataTask resume];
    return movie;
}

//Get data Search Movie
+ (Movie *) getDataSearchMovie :(NSString*) nameMovie {
    Movie *movie;
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@",@"api.themoviedb.org/3/search/movie?api_key=e7631ffcb8e766993e5ec0c1f4245f93&query=",nameMovie];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    AFSecurityPolicy* policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    [policy setValidatesDomainName:NO];
    [policy setAllowInvalidCertificates:YES];
    
    
    NSURLSessionDataTask *dataTask = [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *resul = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:NULL];
        NSLog(@"REPOSEN=====%@", resul);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"FAILD====%@", error);
    }];
    [dataTask resume];
    return movie;
}
@end
