//
//  DetailViewController.h
//  NTableView
//
//  Created by Phu Huynh on 8/4/15.
//  Copyright (c) 2015 Phu Huynh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "Task.h"

@interface DetailViewController : UIViewController{
    
}

@property Task * item;
@property (strong, retain) IBOutlet UITextField* textField;
@property (strong, retain) IBOutlet UITextView* description;

@property ViewController * delegate;

@end
