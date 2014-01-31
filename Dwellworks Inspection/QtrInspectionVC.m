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



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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
