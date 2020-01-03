//
//  ViewController.h
//  demo-mobile.objc
//
//  Created by k on 3/1/2020.
//  Copyright © 2020 k. All rights reserved.
//

#import "h.h"

@interface ViewController : UIViewController<UITableViewDelegate , UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tblList;
-(IBAction) unwindToMain:(UIStoryboardSegue*)segue;
-(IBAction) save:(UIStoryboardSegue*)segue;

@end

