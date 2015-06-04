//
//  MovieDetailsTableViewController.m
//  Rotten Mangoes
//
//  Created by Sunny Surdhar on 2015-05-29.
//  Copyright (c) 2015 Lighthouse Labs. All rights reserved.
//

#import "MovieDetailsTableViewController.h"
#import "Review.h"
#import "ReviewCell.h"

@interface MovieDetailsTableViewController ()

@property (nonatomic, strong) NSArray *data;

@end

@implementation MovieDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.reviews = [[NSMutableArray alloc]init];
    
    NSString *reviewURL = @"http://api.rottentomatoes.com/api/public/v1.0/movies/771374432/reviews.json?apikey=sr9tdu3checdyayjz85mff8j";
    
    NSURLSession *reviewSession = [NSURLSession sharedSession];
    NSURLSessionTask *task = [reviewSession dataTaskWithURL:[NSURL URLWithString:reviewURL] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
       
        NSError *e = nil;
        NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
        
        self.data = [dataDictionary objectForKey:@"reviews"];
        
        for (NSDictionary* reviewDetails in self.data) {
            NSString *critic = reviewDetails[@"critic"];
            NSString *publication = reviewDetails[@"publication"];
            NSString *freshness = reviewDetails[@"freshness"];
            NSString *quote = reviewDetails[@"quote"];
            NSURL *link = reviewDetails[@"links"][@"review"];
            
            Review *review = [[Review alloc]initWithCritic:critic andWithPublication:publication andWithFreshness:freshness andWithQuote:quote andWithLink:link];
            
            [self.reviews addObject:review];
                        
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }];
    
    [task resume];
 
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.reviews.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReviewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reviewCell" forIndexPath:indexPath];
    
    Review *review = self.reviews[indexPath.row];
    cell.criticTextLabel.text = review.critic;
    cell.publicationTextLabel.text = review.publication;
    cell.freshnessTextLabel.text = review.freshness;
    cell.quoteTextLabel.text = review.quote;
    cell.linkTextLabel.text = review.link;

    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
