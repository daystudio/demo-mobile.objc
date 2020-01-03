//
//  ViewController.m
//  demo-mobile.objc
//
//  Created by k on 3/1/2020.
//  Copyright © 2020 k. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(noti_add_item:)
                                                 name:@"reload_table"
                                               object:nil];
    if(self.tblList != nil){
        self.tblList.estimatedRowHeight = 100;
        self.tblList.rowHeight = UITableViewAutomaticDimension;
        self.tblList.dataSource = self;
        self.tblList.delegate = self;
    }
    // Do any additional setup after loading the view.
    [[KData sharedInstance] load:^{
        [self.tblList reloadData];
    }];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString* cellId = @"CellPost";
    CellPost *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[CellPost alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.tag = indexPath.row;
    Post* p = [User sharedInstance].posts[indexPath.row];
    cell.lbl_c.text = p.c;
    cell.lbl_u.text = p.u;
    cell.lbl_t.text = p.t;
    
    [[KIM sharedInstance] load:p.a completion:^(UIImage *image) {
        if(indexPath.row == cell.tag){
            cell.iv_avatar.image = image;
            [cell.iv_avatar setNeedsLayout];
            [cell setNeedsLayout];
            [cell layoutIfNeeded];
            [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }
    }];
    [[KIM sharedInstance] load:p.i completion:^(UIImage *image) {
        if(indexPath.row == cell.tag){
            cell.iv_main.image = image;
            [cell.iv_main setNeedsLayout];
            [cell setNeedsLayout];
            [cell layoutIfNeeded];
            [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }
    }];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [User sharedInstance].posts.count;
}
-(IBAction) unwindToMain:(UIStoryboardSegue*)segue{
    NSLog(@"unwind");
}
-(IBAction) save:(UIStoryboardSegue*)segue{
    [self.tblList setContentOffset:CGPointZero];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"add_item" object:self];
}
-(void) noti_add_item:(NSNotification*)noti{
    [self.tblList reloadData];
}
@end
