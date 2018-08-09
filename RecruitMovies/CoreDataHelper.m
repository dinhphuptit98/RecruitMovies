//
//  CoreDataHelper.m
//  RecruitMovies
//
//  Created by Admin on 8/5/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "CoreDataHelper.h"
#import "AppDelegate.h"
#import "MovieFavorite+CoreDataClass.h"
#import "MovieRemider+CoreDataClass.h"
@implementation CoreDataHelper

+ (CoreDataHelper*)shared {
    static dispatch_once_t predicate = 0;
    __strong static id sharedObject = nil;
    dispatch_once(&predicate, ^{
        sharedObject = [[self alloc] init];
    });
    return sharedObject;
}
- (void)saveContext {
    // Save the context.
    NSError *error = nil;
    if (![[AppDelegate.shared persistentContainer].viewContext save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    } else {
        NSLog(@"Save successful");
    }
}
//get Data name MovieFavorite and insert and delete
- (NSMutableArray *)getFavoriteMovies {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"MovieFavorite"];
    NSError *error = nil;
    NSArray *results = [[AppDelegate.shared persistentContainer].viewContext executeFetchRequest:fetchRequest error:&error];
    if (!results) {
        NSLog(@"Error fetching Movie objects: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    
    NSMutableArray *nameFavoriteMovies = [NSMutableArray new];
    for (MovieFavorite* movie in results) {
        [nameFavoriteMovies addObject:movie.nameMovie];
    }
    return nameFavoriteMovies;
}
- (void)innsertFavorite: (NSString *)nameMovieFavorite {
    NSManagedObjectContext *context = [AppDelegate.shared persistentContainer].viewContext;
    MovieFavorite *newEventFavorite = [[MovieFavorite alloc] initWithContext:context];
    newEventFavorite.nameMovie = nameMovieFavorite;
    [self saveContext];
}
-(void)deleteFavoriteWith: (NSString *)nameMovieFavorite {
    NSManagedObjectContext *context = [AppDelegate.shared persistentContainer].viewContext;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MovieFavorite"];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"nameMovie = %@", nameMovieFavorite];
    [fetchRequest setPredicate:predicate];
    NSArray *moviesFavorite = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    MovieFavorite *movieFavorite = moviesFavorite[0];
    [context deleteObject:movieFavorite];
    
    [self saveContext];
}
//get Data name MovieRemider and insert and delete
- (NSMutableArray *)getRemiderMovies {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"MovieRemider"];
    fetchRequest.returnsObjectsAsFaults = false;
    NSError *error = nil;
    NSArray *results = [[AppDelegate.shared persistentContainer].viewContext executeFetchRequest:fetchRequest error:&error];
    if (!results) {
        NSLog(@"Error fetching Movie objects: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    
    NSMutableArray<MovieRemider*> *moviesRemider = [NSMutableArray new];
    for (MovieRemider* movie in results) {
        [moviesRemider addObject:movie];
    }
    return moviesRemider;
}
- (void)insertRemider: (MovieRemider *)movieRemider {
    NSManagedObjectContext *context = [AppDelegate.shared persistentContainer].viewContext;
    MovieRemider *newMovieRemider = [[MovieRemider alloc] initWithContext:context];
    newMovieRemider = movieRemider;
    [self saveContext];
}



@end
