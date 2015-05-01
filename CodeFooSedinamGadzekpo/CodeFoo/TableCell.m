//
//  TableCell.m
//  Rest
//
//  Created by sedirox on 4/7/15.
//  Copyright (c) 2015 Spring. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell
@synthesize headline = _headline;
@synthesize number = _number;
@synthesize videoSubtitle = _videoSubtitle;
@synthesize duration = _duration;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
