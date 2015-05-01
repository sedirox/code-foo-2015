//
//  abcFirstViewController.m
//  CodeFoo
//
//  Created by sedirox on 4/10/15.
//  Copyright (c) 2015 Spring. All rights reserved.
//

#import "abcFirstViewController.h"
#import "TableCell.h"

@interface abcFirstViewController ()

@end

@implementation abcFirstViewController

//View controller for the articles tab

{
    
    NSMutableArray *headlines;
    NSMutableArray *number;

}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [headlines count];
}

-  (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //A separate nib called TableCell is created for both tab views to easily display the data for each article of video
    static NSString *simpleTableIdentifier = @"TableCell";
    
    TableCell *cell = (TableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    // the text in each cell is replaced with the article name and the number of the article.
    cell.number.text = [number objectAtIndex:indexPath.row];
    cell.headline.text = [headlines objectAtIndex:indexPath.row];
    
   
    
    return cell;

}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //load the data from the API and put it into an NS Dictionary for easy scraping
    number = [[NSMutableArray alloc] init];
    headlines =[[NSMutableArray alloc] init];
    NSString *url = @"http://ign-apis.herokuapp.com/articles?startIndex=0&count=20";
    NSData *allArticleData = [[NSData alloc] initWithContentsOfURL:
                              [NSURL URLWithString: url]];
    
    NSError *error;
    NSDictionary *allArticles = [NSJSONSerialization
                                 JSONObjectWithData:allArticleData
                                 options:kNilOptions
                                 error:&error];
    NSArray *data = allArticles[@"data"];
    
    //scrape the data from the NSDictionary based on the subtitle within the API
    for(NSDictionary *embeddedData in data){
        [number addObject:[NSString stringWithFormat:@"%u",[data indexOfObject:embeddedData]+1]];
        [headlines addObject:embeddedData[@"metadata"][@"headline"]];
        
        
        
        
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
