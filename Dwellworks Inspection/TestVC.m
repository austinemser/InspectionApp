//
//  TestVC.m
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/29/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import "TestVC.h"
#import "InspectionDatabaseAvailability.h"
#import "Inspection+create.h"
#import "QtrInspectionVC.h"


@interface TestVC ()

@end

@implementation TestVC
@synthesize inspectionName;

-(void)awakeFromNib
{
    [[NSNotificationCenter defaultCenter] addObserverForName:InspectionDatabaseAvailabilityNotification
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification *note) {
                                                      self.managedObjectContext = note.userInfo[InspectionDatabaseAvailabilityContext];
                                                  }];
}


-(IBAction)createQtrInspection:(id)sender
{
    self.inspection = [Inspection inspectionWithName:inspectionName.text inManagedObjectContext:self.managedObjectContext];
    
    [self performSegueWithIdentifier:@"QtrInspection Segue" sender:self];
}

-(IBAction)fillData:(id)sender
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Interior" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:nil];
    NSError *error;
    NSDictionary *results = jsonData ? [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error] : nil;
    NSArray *array = results[@"interior"];
    NSLog(@"%@",results);
    for(NSDictionary *key in array)
    {
        NSLog(@"item: %@, condition: %@", key, key[@"condition"]);
    }
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([[segue identifier] isEqualToString:@"QtrInspection Segue"])
    {
        [segue.destinationViewController setInspection:self.inspection];
        
    }
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
