//
//  abcSecondViewController.m
//  CodeFoo
//
//  Created by sedirox on 4/10/15.
//  Copyright (c) 2015 Spring. All rights reserved.
//

#import "abcSecondViewController.h"
#import "TableCell.h"

@interface abcSecondViewController ()

@end

@implementation abcSecondViewController
//view controller for the video tab. Works the same way as the article view controller.


{
    
    NSMutableArray *videoName;
    NSMutableArray *duration;
    NSMutableArray *number;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [videoName count];
}

-  (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"TableCell";
    
    TableCell *cell = (TableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.headline.text = [videoName objectAtIndex:indexPath.row];
    cell.duration.text = [duration objectAtIndex:indexPath.row];
    cell.number.text = [number objectAtIndex:indexPath.row];
    
    
    return cell;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    
    videoName =[[NSMutableArray alloc] init];
    duration = [[NSMutableArray alloc] init];
    number = [[NSMutableArray alloc] init];

    NSString *url = @"http://ign-apis.herokuapp.com/videos?startIndex=0&count=20";
    NSData *allArticleData = [[NSData alloc] initWithContentsOfURL:
                              [NSURL URLWithString: url]];
    
    NSError *error;
    NSDictionary *allArticles = [NSJSONSerialization
                                 JSONObjectWithData:allArticleData
                                 options:kNilOptions
                                 error:&error];
    NSArray *data = allArticles[@"data"];
    for(NSDictionary *embeddedData in data){
        [videoName addObject:embeddedData[@"metadata"][@"title"]];
        //Since the duration in the API is in seconds, it has to be converted into minutes and seconds and then formatted to mm:ss
        NSNumber *dur =  embeddedData[@"metadata"][@"duration"];
        if (dur.intValue <= 59){
         [duration addObject:[NSString stringWithFormat:@" 0:%@",dur]];
        } else {
        float time = dur.floatValue/60;
        float min = floor(time);
        float sec = time - min;
            if(sec*60 < 10){
                [duration addObject:[NSString stringWithFormat:@"%.0f:0%.0f",min, sec*60]];
            } else{
            
        [duration addObject:[NSString stringWithFormat:@"%.0f:%.0f",min, sec*60]];
            }
        }
        [number addObject:[NSString stringWithFormat:@"%u",[data indexOfObject:embeddedData]+1]];

    }
    
   
    
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
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
