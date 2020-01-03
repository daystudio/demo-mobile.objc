//
//  Post.m
//  demo-mobile.objc
//
//  Created by k on 3/1/2020.
//  Copyright © 2020 k. All rights reserved.
//

#import "Post.h"

@implementation Post
-(id)initWithId:(int)i_id c:(NSString*)c t:(NSString*)t u:(NSString*)u i:(NSString*)i a:(NSString*)a{
    if(self = [super init]){
        self.i_id = i_id;
        self.c = c;
        self.t = t;
        self.u = u;
        self.i = i;
        self.a = a;
    }
    return self;
}
@end
