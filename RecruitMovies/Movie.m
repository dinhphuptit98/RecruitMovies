//
//  Movie.m
//  RecruitMovies
//
//  Created by PhuND12 on 8/2/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "Movie.h"

@implementation Movie

-(id)initWithName:(NSString*) nameMovie withDate:(NSString*) date withRating:(NSInteger) rating withOverView:(NSString*) overView withURLImage:(NSString*) URLImage withCheck: (NSInteger) check{
    self = [self init];
    if(self){
        self.nameMovie = nameMovie;
        self.date = date;
        self.rating = rating;
        self.overView = overView;
        self.URLImage = URLImage;
        self.check = check;
    }
    return self;
}

@end
