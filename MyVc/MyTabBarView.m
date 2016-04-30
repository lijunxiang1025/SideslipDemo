//  MyTabBarView.m
//  MyVc
//
//  Created by lijunxiang on 16/4/28.
//  Copyright © 2016年 lijunxiang. All rights reserved.
//

#import "MyTabBarView.h"
#define WIDTH     [UIScreen mainScreen].bounds.size.width
#define Height     [UIScreen mainScreen].bounds.size.height

static  NSArray * _selectImageArr;
static  NSArray * _unSelectImageArr;


@interface MyTabBarView(){
    
    UIImageView * imageVBack;
  

}

@end
@implementation MyTabBarView



- (instancetype)initWithSelectImageArr:(NSArray*)selectImageArr andUnSelectImageArr:(NSArray*)unSelectImageArr andTitleArr:(NSArray*)titleArr andFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //标记选中下标
        NSInteger index = 2;
        //
        _selectImageArr = selectImageArr;
        _unSelectImageArr = unSelectImageArr;
        //创建背景
        imageVBack= [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        //可设置背景色
        imageVBack.backgroundColor = [UIColor whiteColor];
        //可设置背景图片
        imageVBack.image = [UIImage imageNamed:@"1"];
        //开启交互
        imageVBack.userInteractionEnabled = YES;
        [self addSubview:imageVBack];
        
        for (int i = 0; i< selectImageArr.count; i++) {
            
            //建议 一个ImageView 一个label 一个control 这样便于控制
            NSInteger  count = selectImageArr.count;
            
            
            UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake( (WIDTH-count*25)/(count+1)+((WIDTH-count*25)/(count+1)+25)*i,2, 25, 25)];
            imageV.tag =10000 +i;
            [imageVBack addSubview:imageV];
            
            if (index == i) {
                imageV.image = [UIImage imageNamed:selectImageArr[i]];
            }else{
                imageV.image = [UIImage imageNamed:unSelectImageArr[i]];
            }
            
            UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake( 0, 28,100,10)];
            label.text = titleArr[i];
            label.font = [UIFont systemFontOfSize:8];
            label.center = CGPointMake(imageV.center.x, imageV.center.y+7+12.5);
            if (i == index) {
                label.textColor = [UIColor magentaColor];
                
            }else{
                label.textColor = [UIColor orangeColor];
            }
            label.textAlignment = 1 ;
            label.tag = 10100 + i;
            [imageVBack addSubview:label];
            
            
            UIControl * control  = [[UIControl alloc]initWithFrame:CGRectMake(WIDTH/count*i, 0, WIDTH/count, frame.size.height)];
            control.tag = 10200+i;
            [control addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchUpInside];
            
            [imageVBack addSubview:control];
            
            
        }

    }
        
    
    
            return self;
}

- (void)touchDown:(UIControl*)control{
    
    NSInteger  selectIndex  =  control.tag - 10200;
    
  
    [[NSNotificationCenter defaultCenter]postNotificationName:@"select" object:[NSString stringWithFormat:@"%ld",selectIndex]];
    
    for (int i = 0; i< _unSelectImageArr.count; i++) {
        
        
        UIImageView * imageVew = [imageVBack viewWithTag:(10000+i)];
        
        imageVew.image = [UIImage imageNamed:_unSelectImageArr[i]];
        UILabel * label = [imageVBack viewWithTag:(10100+i)];
        label.textColor = [UIColor orangeColor];
        if (i == selectIndex) {
            imageVew.image = [UIImage imageNamed:_selectImageArr[i]];
            label.textColor = [UIColor magentaColor];
            
        }
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
