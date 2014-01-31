//
//  AppDelegate.m
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/29/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+MOC.h"
#import "InspectionDatabaseAvailability.h"

@interface AppDelegate()

@property (strong, nonatomic) NSManagedObjectContext *inspectionDatabaseContext;

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.inspectionDatabaseContext = [self createMainQueueManagedObjectContext];
    
    return YES;
}
							
-(void)setInspectionDatabaseContext:(NSManagedObjectContext *)inspectionDatabaseContext
{
    _inspectionDatabaseContext = inspectionDatabaseContext;
    
    NSDictionary *userInfo = self.inspectionDatabaseContext ? @{InspectionDatabaseAvailabilityContext : self.inspectionDatabaseContext } : nil;
    [[NSNotificationCenter defaultCenter] postNotificationName:InspectionDatabaseAvailabilityNotification object:self userInfo:userInfo];
    
}

@end
