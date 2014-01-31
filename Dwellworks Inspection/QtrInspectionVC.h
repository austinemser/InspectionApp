//
//  QtrInspectionVC.h
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/30/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Inspection.h"
#import "AreaCDTVC.h"

@interface QtrInspectionVC : UIViewController

@property (nonatomic, strong) Inspection *inspection;

-(IBAction)save:(UIBarButtonItem *)sender;

-(IBAction)exterior:(id)sender;
-(IBAction)area:(UIButton *)sender;

@property (nonatomic, strong) IBOutletCollection(UIButton) NSArray *areas;

@end
