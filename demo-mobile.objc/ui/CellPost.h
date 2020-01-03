//
//  CellPostTableViewCell.h
//  demo-mobile.objc
//
//  Created by k on 3/1/2020.
//  Copyright © 2020 k. All rights reserved.
//

#import "h.h"

NS_ASSUME_NONNULL_BEGIN

@interface CellPost : UITableViewCell
@property IBOutlet UIImageView *iv_avatar;
@property IBOutlet UILabel *lbl_u;
@property IBOutlet UILabel *lbl_t;
@property IBOutlet UILabel *lbl_c;
@property IBOutlet UIImageView *iv_main;
@end

NS_ASSUME_NONNULL_END
