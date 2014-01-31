//
//  Area.h
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/31/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Inspection;

@interface Area : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * condition;
@property (nonatomic, retain) NSString * imageUrl;
@property (nonatomic, retain) NSString * comments;
@property (nonatomic, retain) Inspection *inspection;

@end
