//
//  ViewController.h
//  Rotten Mangoes
//
//  Created by Sunny Surdhar on 2015-05-28.
//  Copyright (c) 2015 Lighthouse Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCollectionViewController : UICollectionViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *movies;

@end

