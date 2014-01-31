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

-(void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    _managedObjectContext = managedObjectContext;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Exterior"];
    request.predicate = [NSPredicate predicateWithFormat:@"inspection = %@", self.inspection];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"type"
                                                              ascending:YES
                                                               selector:@selector(localizedStandardCompare:)]];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:managedObjectContext
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
