//
//  VCForm.m
//  demo-mobile.objc
//
//  Created by k on 3/1/2020.
//  Copyright © 2020 k. All rights reserved.
//

#import "VCForm.h"

@interface VCForm ()

@end

@implementation VCForm

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(noti_add_item:)
                                                 name:@"add_item"
                                               object:nil];
}

-(void) noti_add_item:(NSNotification*)noti{
    NSLog(@"perform save");
    [[KData sharedInstance] save:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"reload_table" object:self];
    }
                               u:self.tv_u.text == nil?@"":self.tv_u.text
                               a:self.tv_a.text == nil?@"":self.tv_a.text
                               t:self.tv_t.text == nil?@"":self.tv_t.text
                               c:self.tv_c.text == nil?@"":self.tv_c.text
                               i:self.tv_i.text == nil?@"":self.tv_i.text];
}

@end
