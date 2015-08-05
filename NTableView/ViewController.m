//
//  ViewController.m
//  NTableView
//
//  Created by Phu Huynh on 8/4/15.
//  Copyright (c) 2015 Phu Huynh. All rights reserved.
//

#import "ViewController.h"
#import "AddItemViewController.h"
#import "DetailViewController.h"

@interface ViewController()

@end


@implementation ViewController
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Init items
    self->items = [NSMutableArray arrayWithObjects:@"Meat", @"Fish", @"Chicken", @"Port", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self->items count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellIdenfity = @"Cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: cellIdenfity];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: cellIdenfity];
    }
    
    cell.textLabel.text = self->items[indexPath.row];
    
    
    return cell;
    
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Remove data
        [self->items removeObjectAtIndex:indexPath.row];
        
        //add code here for when you hit delete
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString: @"ViewDetail"]){ //
        // Get destination view controller
        DetailViewController * detailViewController = [segue destinationViewController];
        
        // Get selected row on table view then set to item on Detail View controller
        NSInteger index = tableView.indexPathForSelectedRow.row;
        
        
        [detailViewController setItem:[items objectAtIndex:index]];
        [detailViewController setDelegate:self];
        
        
    }else if ([segue.identifier isEqualToString:@"AddItem"]){
        AddItemViewController * addItemViewController = [segue destinationViewController];
        
        [addItemViewController setDelegate:self];
    }
}

- (void) saveItem:(NSString*) oldValue with:(NSString*)newValue{
    //index
    NSInteger index = [items indexOfObject:oldValue];
    [items removeObjectAtIndex:index];
    [items insertObject:newValue atIndex:index];
    
    [tableView reloadData];
}

- (void) addItemWithString:(NSString *)value{
    [items addObject:value];
    
    [tableView reloadData];
}


@end
