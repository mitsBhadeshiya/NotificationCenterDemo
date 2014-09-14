//
//  MainViewController.h
//  NotificationCenterDemo
//
//  Created by Mitul on 01/09/14.
//  Copyright (c) 2014 vishva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITableViewDelegate , UITableViewDataSource>
{
    
}
@property (strong , nonatomic) IBOutlet UITableView *tableList;
@property (strong , nonatomic) NSMutableArray *arrList;


@end
