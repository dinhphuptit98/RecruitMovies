//
//  Character.m
//  RecruitMovies
//
//  Created by Admin on 8/2/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "Character.h"

@implementation Character
-(id)init:(NSString*) nameCharacter withURLImage:(NSString*) URLImage{
    self = [self init];
    if(self){
        self.nameCharacter = nameCharacter;
        self.URLImage = URLImage;
    
    }
    return self;
}
@end
