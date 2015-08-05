//
//  DetailViewController.m
//  NTableView
//
//  Created by Phu Huynh on 8/4/15.
//  Copyright (c) 2015 Phu Huynh. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize item = item;
@synthesize textField = textField;
@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Update text field
    textField.text = item;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveItem:(id)sender{
    [delegate saveItem:item with:textField.text];
    // Dismiss view controller
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}

@end
