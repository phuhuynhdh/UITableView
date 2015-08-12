//
//  Task.h
//  NTableView
//
//  Created by Phu Huynh on 8/12/15.
//  Copyright (c) 2015 Phu Huynh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Task : NSManagedObject

@property (nonatomic, retain) NSNumber * complete;
@property (nonatomic, retain) NSString * taskDescription;
@property (nonatomic, retain) NSString * taskName;

@end
