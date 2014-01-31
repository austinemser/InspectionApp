//
//  SavedInspectionsCDTVC.m
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/31/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import "SavedInspectionsCDTVC.h"
#import "InspectionDatabaseAvailability.h"


@interface SavedInspectionsCDTVC ()
@property (nonatomic, strong) Inspection *inspection;
@end

@implementation SavedInspectionsCDTVC

-(void)awakeFromNib
{
    [[NSNotificationCenter defaultCenter] addObserverForName:InspectionDatabaseAvailabilityNotification
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification *note) {
                                                      self.managedObjectContext = note.userInfo[InspectionDatabaseAvailabilityContext];
                                                  }];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Saved Cell"];
    
    Inspection *inspection = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = inspection.name;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.inspection = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"Load Saved Qtr" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier]isEqualToString:@"Load Saved Qtr"])
    {
        [segue.destinationViewController setInspection:self.inspection];
    }
}

-(void)viewDidLoad
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Inspection"];
    request.predicate = nil;
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name"
                                                              ascending:YES
                                                               selector:@selector(localizedStandardCompare:)]];
    
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:self.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
}



@end
