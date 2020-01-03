//
//  KData.h
//  demo-mobile.objc
//
//  Created by k on 3/1/2020.
//  Copyright © 2020 k. All rights reserved.
//

#import "h.h"

NS_ASSUME_NONNULL_BEGIN
#define SZ_URL   @"https://crt8b3p0n9.execute-api.ap-southeast-1.amazonaws.com/prod"

@interface KData : NSObject
+(KData*)sharedInstance;
-(void) load:(void(^)(void))completion;
-(void) save:(void(^)(void))completion u:(NSString*)u a:(NSString*)a t:(NSString*)t c:(NSString*)c i:(NSString*)i;
@end

NS_ASSUME_NONNULL_END
