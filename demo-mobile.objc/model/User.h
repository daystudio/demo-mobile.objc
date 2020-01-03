//
//  User.h
//  demo-mobile.objc
//
//  Created by k on 3/1/2020.
//  Copyright © 2020 k. All rights reserved.
//

#import "h.h"

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject
@property NSArray* posts;
+(User*)sharedInstance;
@end

NS_ASSUME_NONNULL_END
