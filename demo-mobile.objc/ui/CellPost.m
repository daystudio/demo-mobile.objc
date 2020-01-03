//
//  CellPostTableViewCell.m
//  demo-mobile.objc
//
//  Created by k on 3/1/2020.
//  Copyright © 2020 k. All rights reserved.
//

#import "CellPost.h"

@implementation CellPost

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.iv_avatar.frame = CGRectMake(self.iv_avatar.frame.origin.x, self.iv_avatar.frame.origin.y, 70,70);
    self.iv_avatar.layer.cornerRadius = self.iv_avatar.frame.size.width / 2.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
