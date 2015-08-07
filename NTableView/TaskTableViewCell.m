//
//  TaskTableViewCell.m
//  NTableView
//
//  Created by Phu Huynh on 8/6/15.
//  Copyright (c) 2015 Phu Huynh. All rights reserved.
//

#import "TaskTableViewCell.h"

@implementation TaskTableViewCell

@synthesize name;
@synthesize description;
@synthesize tickImage;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
