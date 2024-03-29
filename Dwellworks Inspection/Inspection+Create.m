//
//  Inspection+Create.m
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/30/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import "Inspection+Create.h"

@implementation Inspection (Create)

+(Inspection *)inspectionWithName:(NSString *)name
                       inManagedObjectContext:(NSManagedObjectContext *)context
{
    Inspection *inspection = nil;
    
    if([name length]){
        inspection = [NSEntityDescription insertNewObjectForEntityForName:@"Inspection"
                                                   inManagedObjectContext:context];
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Inspection"];
        request.predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
        
        NSError *error;
        NSArray *matches = [context executeFetchRequest:request error:&error];
        
        if(!matches || ([matches count] >1)) {
            //handle error here?
        } else if ([matches count] == 1)
        {
            inspection = [matches lastObject];
        } else
        {
            inspection = [NSEntityDescription insertNewObjectForEntityForName:@"Inspection"
                                                       inManagedObjectContext:context];
            
            inspection.name = name;
            //Set FK columns from JSON
            NSMutableSet *interiors = [NSMutableSet set];
            for(NSDictionary *dict in [QtrModel interior])
            {
                Interior *interior = [NSEntityDescription insertNewObjectForEntityForName:@"Interior" inManagedObjectContext:context];
                interior.type = dict[@"type"];
                interior.condition = dict[@"condition"];
                [interiors addObject:interior];
            }
            [inspection addInterior:interiors];
            
            NSMutableSet *exteriors = [NSMutableSet set];
            for(NSDictionary *dict in [QtrModel exterior])
            {
                Exterior *exterior = [NSEntityDescription insertNewObjectForEntityForName:@"Exterior" inManagedObjectContext:context];
                exterior.type = dict[@"type"];
                exterior.condition = dict[@"condition"];
                [exteriors addObject:exterior];
            }
            [inspection addExterior:exteriors];
            
            NSMutableSet *areas = [NSMutableSet set];
            for(NSDictionary *dict in [QtrModel area])
            {
                Area *area = [NSEntityDescription insertNewObjectForEntityForName:@"Area" inManagedObjectContext:context];
                area.name = dict[@"name"];
                area.type = dict[@"type"];
                area.condition = dict[@"condition"];
                [areas addObject:area];
            }
            [inspection addArea:areas];
        }
        
        
    }
    
    return inspection;
}


@end
