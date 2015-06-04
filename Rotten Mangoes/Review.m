//
//  Review.m
//  Rotten Mangoes
//
//  Created by Sunny Surdhar on 2015-05-29.
//  Copyright (c) 2015 Lighthouse Labs. All rights reserved.
//

#import "Review.h"

@implementation Review

-(instancetype) initWithCritic:(NSString*)critic andWithPublication:(NSString*)publication andWithFreshness:(NSString*)freshness andWithQuote:(NSString*)quote andWithLink:(NSURL*)link {
    
    self = [super init];
    if (self) {
        self.critic = critic;
        self.publication = publication;
        self.freshness = freshness;
        self.quote = quote;
        self.link = link;
    }
    return self;
}

@end
