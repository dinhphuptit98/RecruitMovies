//
//  Character.h
//  RecruitMovies
//
//  Created by Admin on 8/2/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Character : NSObject

-(id)init:(NSString*) nameCharacter withURLImage:(NSString*) URLImage;

@property (nonatomic,copy) NSString *nameCharacter;
@property (nonatomic,copy) NSString *URLImage;



@end
