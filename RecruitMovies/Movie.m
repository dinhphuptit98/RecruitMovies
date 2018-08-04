//
//  Movie.m
//  RecruitMovies
//
//  Created by PhuND12 on 8/2/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "Movie.h"

@implementation Movie

-(id)initWithName:(NSInteger)idMovie nameMovie:(NSString*) nameMovie withDate:(NSString*) dateMovie withRating:(double) rating withOverView:(NSString*) overView withURLImage:(NSString*) URLImage withAdult: (bool) adult {
    self = [self init];
    if(self){
        self.idMovie = idMovie;
        self.nameMovie = nameMovie;
        self.dateMovie = dateMovie;
        self.rating = rating;
        self.overView = overView;
        self.URLImage = URLImage;
        self.adult = adult;
    }
    return self;
}

@end
