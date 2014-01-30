//
//  DwellworksLogin.m
//  TestLogin
//
//  Created by Austin Emser on 1/28/14.
//  Copyright (c) 2014 Austin Emser. All rights reserved.
//

#import "DwellworksLogin.h"

@implementation DwellworksLogin
@synthesize responseData;

-(int)loginWithUsername:(NSString *)username andPassword:(NSString *)password
{
    NSDictionary *loginDict = @{@"data" : username,
                                @"infoOne" : @"infoOne",
                                @"infoTwo" : @"infoTwo",
                                @"infoThree" : @"infoThree"
                                };
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:loginDict options:kNilOptions error:&error];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    request.URL = [NSURL URLWithString:LoginEndPoint];
    request.HTTPMethod = @"POST";
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    request.HTTPBody = jsonData;
    NSError *urlError;
    NSURLResponse *response;
    NSData *respData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&urlError];
    
    return [[[NSString alloc] initWithData:respData encoding:NSUTF8StringEncoding] isEqualToString:@"Success"] ? 1 : 0;
}



#pragma mark - NSURLConnection Delegate Methods

- (void) connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    NSLog(@"Auth Challenge");
    if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
        [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust]
             forAuthenticationChallenge:challenge];
    }
    
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

- (BOOL) connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    if([[protectionSpace authenticationMethod] isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
        return YES;
    }
    
    return NO;
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.responseData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    self.responseData = [[NSMutableData alloc] initWithData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Connection failed: %@", [error description]);
}

-(void)connectionDidFinishLaunching:(NSURLConnection *)connection {
    NSString *responseString = [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding];
    self.responseData = nil;
}

@end
