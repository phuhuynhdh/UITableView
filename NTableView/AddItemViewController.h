//
//  AddItemViewController.h
//  NTableView
//
//  Created by Phu Huynh on 8/4/15.
//  Copyright (c) 2015 Phu Huynh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "AppDelegate.h"

@interface AddItemViewController : UIViewController

@property (strong, retain) IBOutlet UITextField* textField;
@property ViewController * delegate;
@property (strong, retain) IBOutlet UITextView* textView;

@end
