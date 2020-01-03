//
//  Post.h
//  demo-mobile.objc
//
//  Created by k on 3/1/2020.
//  Copyright © 2020 k. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Post : NSObject
@property int i_id;
@property NSString* c;
@property NSString* t;
@property NSString* u;
@property NSString* i;
@property NSString* a;
-(id)initWithId:(int)i_id c:(NSString*)c t:(NSString*)t u:(NSString*)u i:(NSString*)i a:(NSString*)a;
@end

NS_ASSUME_NONNULL_END
