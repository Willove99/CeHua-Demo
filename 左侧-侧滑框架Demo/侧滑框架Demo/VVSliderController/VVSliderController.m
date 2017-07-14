
//  VVSliderController.m
//  侧滑框架Demo
//
//  Created by 王惠平 on 17/1/20.
//  Copyright © 2017年 will wang. All rights reserved.
//

#import "VVSliderController.h"

@interface VVSliderController ()

@property (nonatomic, strong) UIViewController *rightVc;

@property (nonatomic, strong) UITapGestureRecognizer  *tap;

@end

@implementation VVSliderController

- (instancetype)initWithLeftViewController:(UIViewController *)leftVc withRightViewController:(UIViewController *)rightVc {
    
    if (self = [super init]) {
        
        //1.addCHild
        [self addChildViewController:leftVc];
        [self addChildViewController:rightVc];
        
        //2.添加子VIew
        [self.view addSubview:leftVc.view];
        [self.view addSubview:rightVc.view];
        
        //3.didmove
        [leftVc didMoveToParentViewController:self];
        [rightVc didMoveToParentViewController:self];
        
        //4.添加拖拽手势
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        
        [self.view addGestureRecognizer:pan];
        
        //关联
        _rightVc = rightVc;

    }
    
    return self;
}

//轻点 关闭
- (void)tapAction:(UITapGestureRecognizer *)sender {
    
    //NSLog(@"tap---");
    
    [self close];
}

- (void)panAction:(UIPanGestureRecognizer *)sender {
    
    //1.获取移动的偏移量
    CGPoint offset = [sender translationInView:sender.view];
    
    //2.清零
    [sender setTranslation:CGPointZero inView:sender.view];
    
    
    //判断范围
    //NSLog(@"%f",offset.x);
    
    //offset.x 只要左滑就是负的
    if ((offset.x  + _rightVc.view.frame.origin.x) > 0) {
        
        return;
    }
    
    //判断手势的状态
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStateChanged:
            
            //3.改变形变属性
            _rightVc.view.transform = CGAffineTransformTranslate(_rightVc.view.transform, offset.x, 0);
           
            break;
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        {
            
            //判断 是否超过了 屏幕的一半
            CGFloat width = [UIScreen mainScreen].bounds.size.width;
            
            if (ABS(_rightVc.view.frame.origin.x) > width * 0.5) {
                
                [self open];
                
            }else if ((_rightVc.view.frame.origin.x + width) > width * 0.5){
                
                [self close];
            }
        }
            break;
            
        default:
            break;
    }
    
}

//关闭侧滑
- (void)close{
    
    [UIView animateWithDuration:.5 animations:^{
        
        _rightVc.view.transform = CGAffineTransformIdentity;
    }];
    
    //删除 tap手势
    [_rightVc.view removeGestureRecognizer:_tap];
    _tap = nil;
    
}

//打开侧滑
- (void)open {
    
    //判断 是否超过了 屏幕的一半
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat margin = 64;
    
    [UIView animateWithDuration:.5 animations:^{
        
        _rightVc.view.transform = CGAffineTransformMakeTranslation(margin - width, 0);
    }];
    
    //如果tap手势存在 不重复添加
    //    if(![_rightVc.view.gestureRecognizers containsObject:_tap]){
    //
    //
    //    }
    
    if (_tap == nil) {
        
        //5.添加tap
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        
        [_rightVc.view addGestureRecognizer:tap];
        
        //关联
        _tap = tap;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.backgroundColor = [UIColor purpleColor];
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


