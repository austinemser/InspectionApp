//
//  AreaCDTVC.h
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/31/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import "CoreDataTableViewController.h"
#import "Inspection.h"
#import "Area.h"

@interface AreaCDTVC : CoreDataTableViewController

@property (nonatomic, strong) NSDictionary *senderInfo;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

-(IBAction)save:(UIBarButtonItem *)sender;

@end
