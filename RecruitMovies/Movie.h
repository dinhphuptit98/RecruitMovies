//
//  Movie.h
//  RecruitMovies
//
//  Created by PhuND12 on 8/2/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

-(id)initWithName:(NSString*) nameMovie withDate:(NSString*) date withRating:(NSInteger) rating withOverView:(NSString*) overView withURLImage:(NSString*) URLImage withCheck: (NSInteger) check;

@property (nonatomic,copy) NSString *nameMovie;
@property (nonatomic,copy) NSString *date;
@property (nonatomic,assign) NSInteger rating;
@property (nonatomic,copy) NSString *overView;
@property (nonatomic,copy) NSString *URLImage;
@property (nonatomic,assign) NSInteger check;

@end
