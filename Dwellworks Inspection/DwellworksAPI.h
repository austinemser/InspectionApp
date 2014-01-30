//
//  DwellworksAPI.h
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/29/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DwellworksAPIConfig.h"
#import "DwellworksLogin.h"

@interface DwellworksAPI : NSObject
+(int)loginWithUsername:(NSString *)username andPassword:(NSString *)password;
@end
