//
//  AreaCDTVC.m
//  Dwellworks Inspection
//
//  Created by Austin Emser on 1/31/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import "AreaCDTVC.h"

@interface AreaCDTVC ()

@end

@implementation AreaCDTVC

-(void)setSenderInfo:(NSDictionary *)senderInfo
{
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Area Cell"];
    
    
    
    return cell;
}

@end
