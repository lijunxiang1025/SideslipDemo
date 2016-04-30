//
//  ViewController1.m
//  MyVc
//
//  Created by lijunxiang on 16/4/28.
//  Copyright © 2016年 lijunxiang. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    
    //注意viewDidLoad 其实在alloc的时候已经执行完毕
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
    label.text = @"第一页";
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
