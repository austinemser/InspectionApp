//
//  QtrInspectionVC.m
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/30/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import "QtrInspectionVC.h"

@interface QtrInspectionVC ()

@end

@implementation QtrInspectionVC
@synthesize inspection;

-(IBAction)save:(UIBarButtonItem *)sender
{
    NSError *error = nil;
    if(self.inspection.managedObjectContext != nil)
    {
        if([self.inspection.managedObjectContext hasChanges] && ![self.inspection.managedObjectContext save:&error])
        {
            NSLog(@"Unresolved error %@", error);
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = self.inspection.name;
}

-(IBAction)exterior:(id)sender
{
    [self performSegueWithIdentifier:@"Exterior Segue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"Exterior Segue"])
    {
        [segue.destinationViewController setInspection:inspection];
    }
}


@end
