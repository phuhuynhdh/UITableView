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
- (void) saveItem:(Task*) oldValue with:(Task*)newValue;
- (void) addItemWithString:(Task*) value;

@end

@interface ViewController : UIViewController<ViewControllerDelegate>{
    NSMutableDictionary * items;
    NSMutableArray * sectionTitles;
    NSArray * aZIndexTitles;
}
@property (strong, retain) IBOutlet UITableView * tableView;
@end

