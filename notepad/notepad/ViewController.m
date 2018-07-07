//
//  ViewController.m
//  notepad
//
//  Created by Zhang Liqiang on 2018/6/22.
//  Copyright © 2018年 Zhang Liqiang. All rights reserved.
//

#import "ViewController.h"
#import <Realm/Realm.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:[UIColor redColor]];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
//    [realm addOrUpdateObject:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
