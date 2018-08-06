//
//  CharacterManager.m
//  RecruitMovies
//
//  Created by Admin on 8/2/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "CharacterManager.h"

@implementation CharacterManager

//get data Character
+ (void) getDataCharacter:(NSString *)URLlink blockSuccess:(void(^)(NSMutableArray *resultCharacter))blockSuccess blockFailure:(void(^)(NSError *error))blockFailure{
    
    NSMutableArray<Character*> *arrCharacter = [[NSMutableArray  alloc] init];
    
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
        NSArray *casts = object[@"cast"];
        
        for(int i=0;i<casts.count;i++){
            Character *character = [[Character alloc] init];
            character.nameCharacter = [casts[i] valueForKey:@"name"];
            character.URLImage = [casts[i] valueForKey:@"profile_path"];
            [arrCharacter addObject:character];
        }
        blockSuccess(arrCharacter);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"FAILD====%@", error);
        blockFailure(error);
    }];
    [dataTask resume];
}
@end
