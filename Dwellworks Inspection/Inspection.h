//
//  Inspection.h
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/30/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Exterior, Interior;

@interface Inspection : NSManagedObject

@property (nonatomic, retain) NSString * owner;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * zip;
@property (nonatomic, retain) NSString * pmFileNumber;
@property (nonatomic, retain) NSString * inspectedBy;
@property (nonatomic, retain) NSDate * dateOfWalkThrough;
@property (nonatomic, retain) NSString * walkthroughType;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *exterior;
@property (nonatomic, retain) NSSet *interior;
@end

@interface Inspection (CoreDataGeneratedAccessors)

- (void)addExteriorObject:(Exterior *)value;
- (void)removeExteriorObject:(Exterior *)value;
- (void)addExterior:(NSSet *)values;
- (void)removeExterior:(NSSet *)values;

- (void)addInteriorObject:(Interior *)value;
- (void)removeInteriorObject:(Interior *)value;
- (void)addInterior:(NSSet *)values;
- (void)removeInterior:(NSSet *)values;

@end
