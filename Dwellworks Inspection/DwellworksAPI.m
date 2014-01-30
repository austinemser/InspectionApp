//
//  DwellworksAPI.m
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/29/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import "DwellworksAPI.h"

@implementation DwellworksAPI


+(int)loginWithUsername:(NSString *)username andPassword:(NSString *)password
{
    DwellworksLogin *login = [[DwellworksLogin alloc] init];
    int retVal = [login loginWithUsername:username andPassword:password];
    
    return retVal;
}



@end
