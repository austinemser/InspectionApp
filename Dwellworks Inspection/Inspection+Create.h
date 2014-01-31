//
//  Inspection+Create.h
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/30/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import "Inspection.h"
#import "QtrModel.h"
#import "Interior.h"
#import "Exterior.h"

@interface Inspection (Create)
+(Inspection *)inspectionWithName:(NSString *)name
                       inManagedObjectContext:(NSManagedObjectContext *)context;
+ (BOOL) saveWithContext:(NSManagedObjectContext *)context;
@end
