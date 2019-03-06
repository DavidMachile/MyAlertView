//
//  ViewController.m
//  MyAlertView封装
//
//  Created by cctv-person on 2019/3/6.
//  Copyright © 2019 cctv-person. All rights reserved.
//

#import "ViewController.h"
#import "MyAlertView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //调用
    [self.view addSubview:[MyAlertView alterViewWithTitle:@"title" content:@"content" cancel:@"取消" sure:@"确认" cancelBtClcik:^{
        
    } sureBtClcik:^{
        
    }]];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
