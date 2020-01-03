//
//  KIM.h
//  demo-mobile.objc
//
//  Created by k on 3/1/2020.
//  Copyright © 2020 k. All rights reserved.
//

#import "h.h"

NS_ASSUME_NONNULL_BEGIN

@interface KIM : NSObject
@property NSMutableDictionary *images;
+(KIM*)sharedInstance;
-(void) load:(NSString*)sz_url completion:(void(^)(UIImage*))completion;
@end

NS_ASSUME_NONNULL_END
