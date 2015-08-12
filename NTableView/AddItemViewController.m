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
    // Get Application Delete
    AppDelegate * appDelegate = [[UIApplication sharedApplication] delegate];
    // Get Managed Object Context
    NSManagedObjectContext * managedObjectContext = [appDelegate managedObjectContext];
    
    Task* task = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:managedObjectContext];
    
    //[task setValue:textField.text forKey:@"taskName"];
    // [task setValue:textView.text forKey:@"taskDescription"];
    task.taskName = textField.text;
    task.taskDescription = textView.text;
    task.complete = [NSNumber  numberWithInt:0];
    
    [delegate addItemWithString:task];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
