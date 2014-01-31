//
//  QtrInspectionVC.h
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/30/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Inspection.h"

@interface QtrInspectionVC : UIViewController

@property (nonatomic, strong) Inspection *inspection;

-(IBAction)exterior:(id)sender;

@end
