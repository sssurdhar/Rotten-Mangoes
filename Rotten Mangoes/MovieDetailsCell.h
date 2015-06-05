//
//  MovieDetailsCell.h
//  Rotten Mangoes
//
//  Created by Sunny Surdhar on 2015-06-04.
//  Copyright (c) 2015 Lighthouse Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieDetailsCell : UITableViewCell

@property (weak,nonatomic) IBOutlet UILabel *titleLabel;
@property (weak,nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak,nonatomic) IBOutlet UIImageView *movieImage;

@end
