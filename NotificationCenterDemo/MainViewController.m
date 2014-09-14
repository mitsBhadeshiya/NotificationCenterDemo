//
//  MainViewController.m
//  NotificationCenterDemo
//
//  Created by Mitul on 01/09/14.
//  Copyright (c) 2014 vishva. All rights reserved.
//

#import "MainViewController.h"
#import "SecondViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize arrList;
@synthesize tableList;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //http://nshipster.com/nsnotification-and-nsnotificationcenter/
    
    
    arrList = [[NSMutableArray alloc]init];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onClickAdd)];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receiveTestNotificationCenter:) name:@"NotificationText" object:nil];
    
    
    [arrList addObject:@"Mits"];
    [self.tableList reloadData];
}

#pragma mark - 
#pragma mark - Notification

-(void)receiveTestNotificationCenter:(NSNotification *) notification
{
    if([notification.name isEqualToString:@"NotificationText"]){
        
        NSDictionary *dictData = notification.userInfo;
        
        [arrList addObject: [dictData objectForKey:@"name"]];
        [self.tableList reloadData];
        
    }
}

-(void)onClickAdd
{
    SecondViewController *viewControler = [[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
    [self.navigationController pushViewController:viewControler animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrList count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [arrList objectAtIndex:indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
