//
//  SavedInspectionsCDTVC.h
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/31/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import "CoreDataTableViewController.h"
#import "Inspection.h"
#import "QtrInspectionVC.h"

@interface SavedInspectionsCDTVC : CoreDataTableViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end
