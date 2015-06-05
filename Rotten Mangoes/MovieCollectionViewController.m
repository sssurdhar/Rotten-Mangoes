//
//  ViewController.m
//  Rotten Mangoes
//
//  Created by Sunny Surdhar on 2015-05-28.
//  Copyright (c) 2015 Lighthouse Labs. All rights reserved.
//

#import "MovieCollectionViewController.h"
#import "Movie.h"
#import "MovieCollectionViewCell.h"
#import "MovieDetailsTableViewController.h"

@interface MovieCollectionViewController ()

@property (nonatomic, strong) NSArray *data;

@end

@implementation MovieCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.movies =[[NSMutableArray alloc] init];
    
    NSString *inTheatersMovieURL = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=sr9tdu3checdyayjz85mff8j&page_limit=50";
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:inTheatersMovieURL]
     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
         NSError *e = nil;
         NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
         
         self.data = [dataDictionary objectForKey:@"movies"];
         
         for (NSDictionary* movieDetails in self.data) {
             NSString *synopsis = movieDetails[@"synopsis"];
             NSString *imageURL = movieDetails[@"posters"][@"thumbnail"];
             NSString *title = movieDetails[@"title"];
             NSNumber *year = movieDetails[@"year"];
             NSString *mpaaRating = movieDetails[@"mpaa_rating"];
             NSNumber *runtime = movieDetails[@"runtime"];
             NSString *releaseDate = movieDetails[@"release_dates"];
             NSString *numberID = movieDetails[@"id"];
             
             Movie *movie = [[Movie alloc]initWithSynopsis:synopsis andWithImageURL:imageURL andWithTitle:title andWithYear:year.intValue andWithMpaa_rating:mpaaRating andWithRuntime:runtime.intValue andWithReleaseDate:releaseDate andWithNumberID:numberID];
             
             [self.movies addObject:movie];
             
         }
         
         dispatch_async(dispatch_get_main_queue(), ^{
             [self.collectionView reloadData];
         });
         
     }];
    
    [task resume];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.movies.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MovieCollectionViewCell *movieCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"movieCell" forIndexPath:indexPath];
    
    Movie *aMovie = self.movies[indexPath.row];
    movieCell.movieTitleLabel.text = aMovie.title;
    
    NSMutableURLRequest *imageURLRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:aMovie.imageURL]];
    NSURLSessionDownloadTask *downloadImage = [[NSURLSession sharedSession] downloadTaskWithRequest:imageURLRequest completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error)
    {
        
        aMovie.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            movieCell.movieImageView.image = aMovie.image;
        });
       
    }];
    [downloadImage resume];
    
    return movieCell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showReviews"]) {
        NSIndexPath *moviePath = [[self.collectionView indexPathsForSelectedItems]firstObject];
        Movie *movie = [self.movies objectAtIndex:moviePath.item];
        MovieDetailsTableViewController *destinationVC = [segue destinationViewController];
        destinationVC.movie = movie;
    }
}


@end












