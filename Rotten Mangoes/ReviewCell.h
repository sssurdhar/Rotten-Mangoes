//
//  ReviewCell.h
//  Rotten Mangoes
//
//  Created by Sunny Surdhar on 2015-06-03.
//  Copyright (c) 2015 Lighthouse Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReviewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *criticTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *publicationTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *freshnessTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *quoteTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *linkTextLabel;

@end
