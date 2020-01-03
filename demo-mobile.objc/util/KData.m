//
//  KData.m
//  demo-mobile.objc
//
//  Created by k on 3/1/2020.
//  Copyright © 2020 k. All rights reserved.
//

#import "KData.h"

@implementation KData
SYNTHESIZE_SINGLETON_FOR_CLASS(KData)
-(void) load:(void(^)(void))completion{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:SZ_URL]];
    [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                     completionHandler:^(NSData *data, NSURLResponse *response, NSError *connectionError) {
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data
                                                        options:0
                                                          error:nil];
        NSMutableArray* ret = [NSMutableArray array];
        for(int i = 0; i < json.count; i++){
            [ret addObject:[[Post alloc] initWithId:[json[i][@"id"] intValue]
                                                  c:json[i][@"c"]
                                                  t:json[i][@"t"]
                                                  u:json[i][@"u"]
                                                  i:json[i][@"i"]
                                                  a:json[i][@"a"]]];
        }
        NSLog(@"ret=%@", ret);
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
            dispatch_async(dispatch_get_main_queue(), ^(void){
                [User sharedInstance].posts = [NSArray arrayWithArray:ret];
                completion();
            });
        });
    }] resume];
}
-(void) save:(void(^)(void))completion u:(NSString*)u a:(NSString*)a t:(NSString*)t c:(NSString*)c i:(NSString*)i {
    
    NSDictionary *dict = @{
        @"u":u,
        @"a":a,
        @"t":t,
        @"c":c,
        @"i":i,
    };
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSString *body = @"";
    if (!jsonData) {
        NSLog(@"%s: error: %@", __func__, error.localizedDescription);
        body = @"{}";
    } else {
        body = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:SZ_URL]];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];
    [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                     completionHandler:^(NSData *data, NSURLResponse *response, NSError *connectionError) {
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data
                                                        options:0
                                                          error:nil];
        NSMutableArray* ret = [NSMutableArray array];
        for(int i = 0; i < json.count; i++){
            [ret addObject:[[Post alloc] initWithId:[json[i][@"id"] intValue]
                                                  c:json[i][@"c"]
                                                  t:json[i][@"t"]
                                                  u:json[i][@"u"]
                                                  i:json[i][@"i"]
                                                  a:json[i][@"a"]]];
        }
        NSLog(@"ret=%@", ret);
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
            dispatch_async(dispatch_get_main_queue(), ^(void){
                [User sharedInstance].posts = [NSArray arrayWithArray:ret];
                completion();
            });
        });
    }] resume];
}
@end
