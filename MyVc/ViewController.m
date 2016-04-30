//
//  ViewController.m
//  MyVc
//
//  Created by lijunxiang on 16/4/28.
//  Copyright © 2016年 lijunxiang. All rights reserved.
//

#import "ViewController.h"
#import "MyTabBarView.h"

#define WIDTH     [UIScreen mainScreen].bounds.size.width
#define Height     [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
{
    UIImageView * backGroundView;
    UIView * manView;
  
    //几个页面
    NSArray * vcArr;
    NSMutableArray * vcA;
    
    BOOL  isLeft ;
    
    MyTabBarView * myTabBarV;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //切换层
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(change:) name:@"select" object:nil];
    
    
    self.navigationController.navigationBar.hidden= YES;
    self.view.backgroundColor = [UIColor redColor];
    //标识侧滑
    isLeft = NO;
    //添加背景色
    backGroundView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    backGroundView.image = [UIImage imageNamed:@"xiong2"];
    [self.view addSubview:backGroundView];

    //承载三个试图控制器视图的manView
    manView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:manView];
    
    //添加三个视图控制器View
    [self addThreeView];
    
    //控制三个视图切换的的假TabBar
    [self createTabBar];
    
    
    
     [self performSelector:@selector(changeView)  withObject:nil afterDelay:3];
}

- (void)addThreeView{
    
     vcArr = @[@"ViewController1",@"ViewController2",@"ViewController3"];
    vcA = [NSMutableArray array];
    
    for (int i = 0 ; i< vcArr.count ; i++) {
        Class a = NSClassFromString(vcArr[i]);
        UIViewController * vc = [[a alloc]init];
        [manView addSubview:vc.view];
        [vcA addObject:vc];
    }
   
   
    
}

- (void)changeView{
    
 
    
 [UIView animateWithDuration:0.2 animations:^{
     CGPoint center = manView.center;
     manView.transform = CGAffineTransformMakeScale(0.8, 0.8);
     manView.center = CGPointMake(center.x+150- WIDTH*0.1,center.y);
     
 }];
    
    
}

//切换层
- (void)change:(NSNotification*)not{
    
    
    
    [manView insertSubview:[vcA[[[not object] intValue]] view] belowSubview: myTabBarV];

     
     //bringSubviewToFront:[vcA[[[not object] intValue]] view]];
    
   

    
    
}


- (void)createTabBar{
    
    //注意 mainView 只需要添加三个控制器View 方便切换视图  这里加载到self.View 上
    
    myTabBarV = [[MyTabBarView alloc]initWithSelectImageArr:@[@"homeSelected@2x",@"foundSelected@2x",@"mySelected@2x"] andUnSelectImageArr:@[@"home@2x",@"found@2x",@"my@2x"] andTitleArr:@[@"消息",@"联系人",@"我的"] andFrame:CGRectMake(0, Height-40, WIDTH, 44)];


    
    [manView addSubview:myTabBarV];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
