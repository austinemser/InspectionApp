//
//  AreaCDTVC.m
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/31/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import "AreaCDTVC.h"

@interface AreaCDTVC ()

@end

@implementation AreaCDTVC

-(void)setSenderInfo:(NSDictionary *)senderInfo
{
    _senderInfo = senderInfo;
    [self setupFetchedResultsController];
}

-(IBAction)save:(UIBarButtonItem *)sender
{
    NSError *error = nil;
    if(self.managedObjectContext != nil)
    {
        if([self.managedObjectContext hasChanges] && ![self.managedObjectContext save:&error])
        {
            NSLog(@"Unresolved error %@", error);
        }
    }
}

-(void)setupFetchedResultsController
{
    Inspection *inspection = self.senderInfo[@"inspection"];
    NSString *areaType = self.senderInfo[@"areaType"];
    self.managedObjectContext = inspection.managedObjectContext;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Area"];
    request.predicate = [NSPredicate predicateWithFormat:@"inspection = %@ AND name = %@", inspection,areaType];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"type"
                                                                  ascending:YES
                                                                   selector:@selector(localizedStandardCompare:)]];
        
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                            managedObjectContext:self.managedObjectContext
                                                                              sectionNameKeyPath:nil
                                                                                       cacheName:nil];
    self.title = areaType;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Area Cell"];
    
    Area *area = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = area.type;
    cell.detailTextLabel.text = area.condition;
    
    return cell;
}

@end
