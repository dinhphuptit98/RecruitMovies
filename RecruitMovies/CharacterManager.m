//
//  CharacterManager.m
//  RecruitMovies
//
//  Created by Admin on 8/2/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "CharacterManager.h"

@implementation CharacterManager

// get data Movie Detail
+ (Character *) getDataCharacter :(NSInteger) idMovie {
    Character *character;
    
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
    return character;
}

@end
