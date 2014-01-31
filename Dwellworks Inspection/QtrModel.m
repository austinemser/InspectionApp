//
//  QtrModel.m
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/30/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import "QtrModel.h"

@implementation QtrModel

+(NSArray *)interior
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Interior" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:nil];
    NSError *error;
    NSDictionary *results = jsonData ? [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error] : nil;
    NSArray *array = results[@"interior"];
    return array;
}

+(NSArray *)exterior
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Exterior" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:nil];
    NSError *error;
    NSDictionary *results = jsonData ? [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error] : nil;
    NSArray *array = results[@"exterior"];
    return array;
}

+(NSArray *)area
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"QtrModel" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:nil];
    NSError *error;
    NSDictionary *results = jsonData ? [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error] : nil;
    NSArray *array = results[@"area"];
    return array;
}

@end
