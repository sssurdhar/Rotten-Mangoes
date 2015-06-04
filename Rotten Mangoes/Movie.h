//
//  Movie.h
//  Rotten Mangoes
//
//  Created by Sunny Surdhar on 2015-05-28.
//  Copyright (c) 2015 Lighthouse Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Movie : NSObject

@property (nonatomic) NSString *synopsis;
@property (nonatomic) NSString *imageURL;
@property (nonatomic) NSString *title;
@property (assign) int year;
@property (nonatomic, strong) NSString *mpaa_rating;
@property (assign) int runtime;
@property (nonatomic) NSString *releaseDate;
@property (nonatomic) UIImage *image;

-(instancetype)initWithSynopsis:(NSString*)synopsis andWithImageURL:(NSString*)imageURL andWithTitle:(NSString*)title andWithYear:(int)year andWithMpaa_rating:(NSString*)mpaa_rating andWithRuntime:(int)runtime andWithReleaseDate:(NSString*)releaseDate;


@end
