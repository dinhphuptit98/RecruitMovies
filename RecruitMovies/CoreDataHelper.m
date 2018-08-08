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

//get Data name MovieFavorite
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

//get Data name MovieRemider
- (NSMutableArray *)getRemiderMovies {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"MovieRemider"];
    NSError *error = nil;
    NSArray *results = [[AppDelegate.shared persistentContainer].viewContext executeFetchRequest:fetchRequest error:&error];
    if (!results) {
        NSLog(@"Error fetching Movie objects: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    
    NSMutableArray *nameMoviesRemider = [NSMutableArray new];
    for (MovieRemider* movie in results) {
        [nameMoviesRemider addObject:movie.nameMovieRemider];
    }
    return nameMoviesRemider;
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

- (void)innsertFavorite: (NSString *)nameMovieFavorite {
    NSManagedObjectContext *context = [AppDelegate.shared persistentContainer].viewContext;
    MovieFavorite *newEventFavorite = [[MovieFavorite alloc] initWithContext:context];
    newEventFavorite.nameMovie = nameMovieFavorite;
    [self saveContext];
}
- (void)innsertRemider: (NSString *)nameMovieRemider {
    NSManagedObjectContext *context = [AppDelegate.shared persistentContainer].viewContext;
    MovieRemider *newEventRemider = [[MovieRemider alloc] initWithContext:context];
    newEventRemider.nameMovieRemider = nameMovieRemider;
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
-(void)deleteRemiderWith: (NSString *)nameMovieRemider {
    NSManagedObjectContext *context = [AppDelegate.shared persistentContainer].viewContext;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MovieRemider"];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"nameMovieRemider = %@", nameMovieRemider];
    [fetchRequest setPredicate:predicate];
    NSArray *moviesRemider = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    MovieFavorite *movieRemider = moviesRemider[0];
    [context deleteObject:movieRemider];
    
    [self saveContext];
}
@end
