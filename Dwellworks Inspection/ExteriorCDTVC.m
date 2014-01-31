//
//  ExteriorCDTVC.m
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/31/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import "ExteriorCDTVC.h"
#import "Exterior.h"

@interface ExteriorCDTVC ()

@end

@implementation ExteriorCDTVC

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

-(void)setInspection:(Inspection *)inspection
{
    _inspection = inspection;
    [self setupFetchedResultsController];
    
}

-(void)setupFetchedResultsController
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Exterior"];
    request.predicate = [NSPredicate predicateWithFormat:@"inspection = %@", self.inspection];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"type"
                                                              ascending:YES
                                                               selector:@selector(localizedStandardCompare:)]];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:self.inspection.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Exterior Cell"];
    
    Exterior *exterior = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = exterior.type;
    cell.detailTextLabel.text = exterior.condition;
    
    return cell;
}

@end
