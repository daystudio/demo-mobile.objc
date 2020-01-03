//
//  KIM.m
//  demo-mobile.objc
//
//  Created by k on 3/1/2020.
//  Copyright © 2020 k. All rights reserved.
//

#import "KIM.h"

@implementation KIM
SYNTHESIZE_SINGLETON_FOR_CLASS(KIM)
-(void) load:(NSString*)sz_url completion:(void(^)(UIImage*))completion{
    if(self.images == nil){
        self.images = [NSMutableDictionary dictionary];
    }else if(self.images[sz_url] != nil){
        completion((UIImage*)self.images[sz_url]);
    }else{
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:sz_url]];
        [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                         completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if(error == nil && data != nil){
                dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
                    dispatch_async(dispatch_get_main_queue(), ^(void){
                        self.images[sz_url] = [UIImage imageWithData:data];
                        completion((UIImage*)self.images[sz_url]);
                    });
                });
            }
        }] resume];
    }
}
@end
