//
//  SecondViewController.m
//  NotificationCenterDemo
//
//  Created by Mitul on 01/09/14.
//  Copyright (c) 2014 vishva. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize txtName;
@synthesize btnSave;

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
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [txtName becomeFirstResponder];
}

-(IBAction)onClickButtonSave:(id)sender
{
    if([txtName.text length] > 0){
        
        NSMutableDictionary *dataDict = [[NSMutableDictionary alloc]init];
        [dataDict setObject:txtName.text forKey:@"name"];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"NotificationText" object:self userInfo:dataDict];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Please enter Some Text" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
