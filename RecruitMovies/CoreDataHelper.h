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
-(void)deleteWith: (NSString *)name;
- (void)innsert: (NSString *)name;
- (void)saveContext;
+ (CoreDataHelper *)shared;
//@property (strong, nonatomic) NSFetchedResultsController<MovieFavorite *> *fetchedResultsController;

@end
