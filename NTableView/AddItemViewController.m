//
//  AddItemViewController.m
//  NTableView
//
//  Created by Phu Huynh on 8/4/15.
//  Copyright (c) 2015 Phu Huynh. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController
@synthesize textField;
@synthesize delegate;
@synthesize textView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addItem:(id)sender{
    Task* task = [[Task alloc] init];
    [task setTaskName:textField.text];
    [task setDescription:textView.text];
    
    [delegate addItemWithString:task];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
