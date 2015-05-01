//
//  TableCell.h
//  Rest
//
//  Created by sedirox on 4/7/15.
//  Copyright (c) 2015 Spring. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *headline;
@property (nonatomic, weak) IBOutlet UILabel *videoSubtitle;
@property (nonatomic, weak) IBOutlet UILabel *number;
@property (nonatomic, weak) IBOutlet UILabel *duration;

@end
