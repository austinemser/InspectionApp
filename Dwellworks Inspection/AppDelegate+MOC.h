//
//  AppDelegate+MOC.h
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/31/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (MOC)

-(NSManagedObjectContext *)createMainQueueManagedObjectContext;

@end
