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
#import "MovieRemider+CoreDataClass.h"
@class CoreDataHelper;

@interface CoreDataHelper : NSObject
- (NSMutableArray *)getFavoriteMovies;
- (NSMutableArray *)getRemiderMovies;
- (void)deleteFavoriteWith: (NSString *)nameMovieFavorite;
- (void)innsertFavorite: (NSString *)nameMovieFavorite ;
- (void)insertRemider: (MovieRemider *)movieRemider;
- (void)saveContext;
+ (CoreDataHelper *)shared;

@end
