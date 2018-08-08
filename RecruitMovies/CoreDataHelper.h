//
//  CoreDataHelper.h
//  RecruitMovies
//
//  Created by Admin on 8/5/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "MovieFavorite+CoreDataClass.h"

@class CoreDataHelper;

@interface CoreDataHelper : NSObject
- (NSMutableArray *)getFavoriteMovies;
- (NSMutableArray *)getRemiderMovies;
-(void)deleteFavoriteWith: (NSString *)nameMovieFavorite;
-(void)deleteRemiderWith: (NSString *)nameMovieRemider;
- (void)innsertFavorite: (NSString *)nameMovieFavorite ;
- (void)innsertRemider: (NSString *)nameMovieRemider;
- (void)saveContext;
+ (CoreDataHelper *)shared;

@end
