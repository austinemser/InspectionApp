//
//  Interior.h
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/30/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Inspection;

@interface Interior : NSManagedObject

@property (nonatomic, retain) NSString * comments;
@property (nonatomic, retain) NSString * condition;
@property (nonatomic, retain) NSString * imageUrl;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) Inspection *inspection;

@end