//
//  TaskTableViewCell.h
//  NTableView
//
//  Created by Phu Huynh on 8/6/15.
//  Copyright (c) 2015 Phu Huynh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskTableViewCell : UITableViewCell

@property (strong, retain) IBOutlet UIButton* tickImage;
@property (strong, retain) IBOutlet UILabel* name;
@property (strong, retain) IBOutlet UILabel* description;

@end
