//
//  MovieDetailsTableViewController.h
//  Rotten Mangoes
//
//  Created by Sunny Surdhar on 2015-05-29.
//  Copyright (c) 2015 Lighthouse Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieDetailsTableViewController : UITableViewController

@property (nonatomic) NSString *movie;
@property (nonatomic) NSMutableArray *reviews;

@end
