//
//  TestVC.h
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/29/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Inspection.h"

@interface TestVC : UIViewController
@property (nonatomic, weak) IBOutlet UITextField *inspectionName;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) Inspection *inspection;
-(IBAction)fillData:(id)sender;
-(IBAction)createQtrInspection:(id)sender;

@end
