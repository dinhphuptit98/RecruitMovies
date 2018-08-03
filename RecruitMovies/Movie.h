//
//  Movie.h
//  RecruitMovies
//
//  Created by PhuND12 on 8/2/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

-(id)initWithName:(NSInteger)idMovie nameMovie:(NSString*) nameMovie withDate:(NSString*) dateMovie withRating:(double) rating withOverView:(NSString*) overView withURLImage:(NSString*) URLImage withCheck: (NSInteger) check withAdult: (NSInteger) adult;
@property (nonatomic,assign) NSInteger adult;
@property (nonatomic,assign) NSInteger idMovie;
@property (nonatomic,copy) NSString *nameMovie;
@property (nonatomic,copy) NSString *dateMovie;
@property (nonatomic,assign) double rating;
@property (nonatomic,copy) NSString *overView;
@property (nonatomic,copy) NSString *URLImage;
@property (nonatomic,assign) NSInteger check;

@end
