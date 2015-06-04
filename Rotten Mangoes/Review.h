//
//  Review.h
//  Rotten Mangoes
//
//  Created by Sunny Surdhar on 2015-05-29.
//  Copyright (c) 2015 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Review : NSObject

@property (nonatomic) NSString* critic;
@property (nonatomic) NSString* publication;
@property (nonatomic) NSString* freshness;
@property (nonatomic) NSString* quote;
@property (nonatomic) NSURL* link;

-(instancetype) initWithCritic:(NSString*)critic andWithPublication:(NSString*)publication andWithFreshness:(NSString*)freshness andWithQuote:(NSString*)quote andWithLink:(NSURL*)link;

@end
