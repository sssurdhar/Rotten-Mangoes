//
//  Movie.m
//  Rotten Mangoes
//
//  Created by Sunny Surdhar on 2015-05-28.
//  Copyright (c) 2015 Lighthouse Labs. All rights reserved.
//

#import "Movie.h"

@implementation Movie

-(instancetype)initWithSynopsis:(NSString*)synopsis andWithImageURL:(NSString*)imageURL andWithTitle:(NSString*)title andWithYear:(int)year andWithMpaa_rating:(NSString*)mpaa_rating andWithRuntime:(int)runtime andWithReleaseDate:(NSString*)releaseDate{
    self = [super init];
    if (self) {
        self.synopsis = synopsis;
        self.imageURL = imageURL;
        self.title = title;
        self.year = year;
        self.mpaa_rating = mpaa_rating;
        self.runtime = runtime;
        self.releaseDate = releaseDate;
    }
    return self;
}

- (NSString *)description
{
    
    return [NSString stringWithFormat:@"Movie with title[%@] year[%d] mpaa_rating[%@] runtime[%d] releasedate[%@] synopsis[%@]", self.title, self.year, self.mpaa_rating, self.runtime, self.releaseDate, self.synopsis];
    
}

@end
