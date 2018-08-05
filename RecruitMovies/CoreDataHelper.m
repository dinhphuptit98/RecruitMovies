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

@implementation CoreDataHelper

+ (CoreDataHelper*)shared {
    static dispatch_once_t predicate = 0;
    __strong static id sharedObject = nil;
    //static id sharedObject = nil;  //if you're not using ARC
    dispatch_once(&predicate, ^{
        sharedObject = [[self alloc] init];
        //sharedObject = [[[self alloc] init] retain]; // if you're not using ARC
    });
    return sharedObject;
}

- (NSMutableArray *)getFavoriteMovies {
//    NSArray *favoriteMovies = [CoreDataHelper.shared fetchedResultsController].fetchedObjects;
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"MovieFavorite"];
    NSError *error = nil;
    NSArray *results = [[AppDelegate.shared persistentContainer].viewContext executeFetchRequest:fetchRequest error:&error];
    if (!results) {
        NSLog(@"Error fetching Movie objects: %@\n%@", [error localizedDescription], [error userInfo]);
    }
//    self.notes = [(NSArray *)results mutableCopy];
    
    NSMutableArray *nameMovies = [NSMutableArray new];
    for (MovieFavorite* movie in results) {
        [nameMovies addObject:movie.nameMovie];
        // do stuff
    }
    return nameMovies;
}

//- (NSFetchedResultsController<MovieFavorite *> *)fetchedResultsController {
//    if (_fetchedResultsController != nil) {
//        return _fetchedResultsController;
//    }
//    
//    NSFetchRequest<MovieFavorite *> *fetchRequest = MovieFavorite.fetchRequest;
//    
//    // Set the batch size to a suitable number.
//    [fetchRequest setFetchBatchSize:20];
//    
//    // Edit the sort key as appropriate.
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"nameMovie" ascending:NO];
//    
//    [fetchRequest setSortDescriptors:@[sortDescriptor]];
//    
//    // Edit the section name key path and cache name if appropriate.
//    // nil for section name key path means "no sections".
//    NSFetchedResultsController<MovieFavorite *> *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:[AppDelegate.shared persistentContainer].viewContext sectionNameKeyPath:nil cacheName:@"Master"];
//    
//    NSError *error = nil;
//    if (![aFetchedResultsController performFetch:&error]) {
//        // Replace this implementation with code to handle the error appropriately.
//        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
//        abort();
//    }
//    
//    _fetchedResultsController = aFetchedResultsController;
//    return _fetchedResultsController;
//}

- (void)saveContext {
    // Save the context.
    NSError *error = nil;
    if (![[AppDelegate.shared persistentContainer].viewContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    } else {
         NSLog(@"Save successful");
    }
}

- (void)innsert: (NSString *)name {
    NSManagedObjectContext *context = [AppDelegate.shared persistentContainer].viewContext;
    MovieFavorite *newEvent = [[MovieFavorite alloc] initWithContext:context];
    
    // If appropriate, configure the new managed object.
    newEvent.nameMovie = name;
    [self saveContext];
}

-(void)deleteWith: (NSString *)name {
    NSManagedObjectContext *context = [AppDelegate.shared persistentContainer].viewContext;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MovieFavorite"];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"nameMovie = %@", name];
    [fetchRequest setPredicate:predicate];
    NSArray *movies = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
 
    MovieFavorite *movie = movies[0];
    [context deleteObject:movie];
    
    [self saveContext];
}
@end
