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

@property (nonatomic) Movie *movie;
@property (nonatomic) NSMutableArray *reviews;

- (IBAction)back;

@end
