//
//  ViewController.h
//  NTableView
//
//  Created by Phu Huynh on 8/4/15.
//  Copyright (c) 2015 Phu Huynh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@protocol ViewControllerDelegate <NSObject>
- (void) saveItem:(NSString*) oldValue with:(NSString*)newValue;
- (void) addItemWithString:(Task*) value;

@end

@interface ViewController : UIViewController<ViewControllerDelegate>{
    NSMutableArray * items;
}
@property (strong, retain) IBOutlet UITableView * tableView;
@end

