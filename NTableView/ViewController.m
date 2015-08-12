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
#import "Task.h"
#import "TaskTableViewCell.h"
#import "AppDelegate.h"

@interface ViewController()

@end


@implementation ViewController
@synthesize tableView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AppDelegate * appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext * managedContext = [appDelegate managedObjectContext];
    
    NSEntityDescription * taskEntity = [NSEntityDescription entityForName:@"Task" inManagedObjectContext:managedContext];
    
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity:taskEntity];
    
    NSArray * fetchObjects = [managedContext executeFetchRequest:request error:nil];
    
    items = [NSMutableArray arrayWithArray:fetchObjects];
    
    
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
    
    static NSString * cellIdenfity = @"TaskCell";
    
    TaskTableViewCell * cell = (TaskTableViewCell*)[tableView dequeueReusableCellWithIdentifier: cellIdenfity];
    
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TaskCell" owner:self options:nil];
        
        cell = [nib objectAtIndex:0];
    }
    // Get task at index path row
    Task* task = self->items[indexPath.row];
    
    cell.name.text = task.taskName;
    cell.description.text = task.taskDescription;
    
    // Show completed tasks/Uncomplete tasks
    if( [task.complete intValue] == 1){ // completed task
        // cell.accessoryType = UITableViewCellAccessoryCheckmark;
        UIImage * doneImage = [UIImage imageNamed:@"Done.png"];
        [cell.tickImage setImage:doneImage forState:UIControlStateNormal];
        
    }else{
        // cell.accessoryType = UITableViewCellAccessoryNone;
        UIImage * doneImage = [UIImage imageNamed:@"" ];
        [cell.tickImage setImage:doneImage forState:UIControlStateNormal];
    }
    // add tag for button
    cell.tickImage.tag = indexPath.row;
    [cell.tickImage addTarget:self action:@selector(makeTaskdone:) forControlEvents:UIControlEventTouchUpInside];
    
    // show reorder control
    cell.showsReorderControl = YES;
    
    // set cell as view detail
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        AppDelegate * appDelegate = [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext * context = [appDelegate managedObjectContext];
        
        Task * taskToDelete = [items objectAtIndex:indexPath.row];
        
        // Mark object as deleted in ManagedObjectConext
        [context deleteObject:taskToDelete];
        
        // Remove object in array
        [self->items removeObjectAtIndex:indexPath.row];
        
        //add code here for when you hit delete
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        // Save to persistent store
        [appDelegate saveContext];
        
        
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

- (void) saveItem:(Task*) oldValue with:(Task*)newValue{
    //index
    NSInteger index = [items indexOfObject:oldValue];
    [items removeObjectAtIndex:index];
    [items insertObject:newValue atIndex:index];
    
    AppDelegate * appDelegate = [[UIApplication sharedApplication] delegate];
   
    //[context deleteObject:oldValue];
    //[context insertObject:newValue];
    oldValue.taskName = newValue.taskName;
    oldValue.taskDescription = newValue.taskDescription;
    oldValue.complete = newValue.complete;
    
    // save persistant store
    [appDelegate saveContext];
    
    [tableView reloadData];
}

- (void) addItemWithString:(Task *)task{
    // Get Application Delete
    AppDelegate * appDelegate = [[UIApplication sharedApplication] delegate];
  
    // [task setValue:0 forKey:@"complete"];
    
    [items addObject:task];
    [tableView reloadData];
    
    // Save to persistent store.
    [appDelegate saveContext];
}

- (void) tableView:(UITableView*) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //Build a segue string based on the selected cell
    NSString *segueString = @"ViewDetail";
    //Since contentArray is an array of strings, we can use it to build a unique
    //identifier for each segue.
    
    //Perform a segue.
    [self performSegueWithIdentifier:segueString
                              sender:[items objectAtIndex:indexPath.row]];
    
}


- (IBAction)editTableView:(id)sender{
    
    if(![tableView isEditing]){
        [tableView setEditing:TRUE animated:TRUE];
        UIBarButtonItem* barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneEdit)];
        self.navigationItem.leftBarButtonItem = barButtonItem;
        
    }
}

- (void) doneEdit{
    [tableView setEditing:FALSE animated:TRUE];
    
    // re-draw edit button
    UIBarButtonItem* barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editTableView:)];
    self.navigationItem.leftBarButtonItem = barButtonItem;
    
}

- (BOOL)tableView:(UITableView*) tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return TRUE;
}

- (void)tableView:(UITableView*) tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    // swap row
    [items exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
}


- (CGFloat)tableView:(UITableView*) tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75.0;
}

- (void) makeTaskdone:(UIButton*) sender{
    
    Task* task = [items objectAtIndex:sender.tag];
    
    if ([task.complete intValue] == 1){
        [task setComplete:[NSNumber numberWithInt:0]];
    }else{
        [task setComplete:[NSNumber numberWithInt:1]];
    }
    
    [self->tableView reloadData];
}

@end
