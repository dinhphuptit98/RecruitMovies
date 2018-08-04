//
//  Constant.m
//  RecruitMovies
//
//  Created by PhuND12 on 8/2/18.
//  Copyright © 2018 RTC-HN156. All rights reserved.
//

#import "Constant.h"

@implementation Constant
NSString *BaseMovieURL = @"api.themoviedb.org/3/configuration?api_key=e7631ffcb8e766993e5ec0c1f4245f93";
NSString *MoviePopular = @"http://api.themoviedb.org/3/movie/popular?api_key=e7631ffcb8e766993e5ec0c1f4245f93&page=";
NSString *MovieTopRates = @"api.themoviedb.org/3/movie/top_rated?api_key=e7631ffcb8e766993e5ec0c1f4245f93&page=";
NSString *MovieUpComing = @"api.themoviedb.org/3/movie/upcoming?api_key=e7631ffcb8e766993e5ec0c1f4245f93&page=";
NSString *MovieNowPlaying = @"api.themoviedb.org/3/movie/now_playing?api_key=e7631ffcb8e766993e5ec0c1f4245f93&page=";
NSString *MovieDetail = @"api.themoviedb.org/3/movie/{movieId}?api_key=e7631ffcb8e766993e5ec0c1f4245f93";
NSString *CastAndCrew = @"api.themoviedb.org/3/movie/{movieId}/credits?api_key=e7631ffcb8e766993e5ec0c1f4245f93";
NSString *SearchMovie = @"api.themoviedb.org/3/search/movie?api_key=e7631ffcb8e766993e5ec0c1f4245f93&query=";
NSString *GetImage = @"image.tmdb.org/t/p/w300/";

@end
