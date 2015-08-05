//
//  DetailViewController.h
//  NTableView
//
//  Created by Phu Huynh on 8/4/15.
//  Copyright (c) 2015 Phu Huynh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface DetailViewController : UIViewController{
    
}

@property NSString * item;
@property (strong, retain) IBOutlet UITextField* textField;
@property ViewController * delegate;

@end
