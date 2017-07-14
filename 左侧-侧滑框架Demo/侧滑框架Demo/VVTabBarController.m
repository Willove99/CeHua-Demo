//
//  VVTabBarController.m
//  侧滑框架Demo
//
//  Created by 王惠平 on 17/1/16.
//  Copyright © 2017年 willwang. All rights reserved.
//

#import "VVTabBarController.h"


@interface VVTabBarController ()

@end

@implementation VVTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.backgroundColor = [UIColor redColor];
    
    //1.添加子控制器
    [self loadSubViewControllers];
}


/**
 添加子控制器
 */
- (void)loadSubViewControllers {
    //1.创建子控制器
    
    //1.1消息
    UIViewController *messageVc = [self loadChildContllerWithClassName:@"VVMessageController" withTitle:@"消息" withImageName:@"tab_recent_nor"];
    
    //1.2联系人
     UIViewController *contactVc = [self loadChildContllerWithClassName:@"VVContactController" withTitle:@"联系人" withImageName:@"tab_buddy_nor"];
    
    //1.3动态
     UIViewController *qzoneVc = [self loadChildContllerWithClassName:@"VVQzoneController" withTitle:@"动态" withImageName:@"tab_qworld_nor"];
    
    //1.4设置
     UIViewController *settingVc = [self loadChildContllerWithClassName:@"VVSettingController" withTitle:@"设置" withImageName:@"tab_me_nor"];
    
    
    //2.添加
    self.viewControllers = @[messageVc,contactVc,qzoneVc,settingVc];
    
}


/**
创建子控制器 设置内容
 */
- (UIViewController *)loadChildContllerWithClassName:(NSString *)className withTitle:(NSString *)title  withImageName:(NSString *)imageName {

    //1.根据字符串生成类
    Class class = NSClassFromString(className);
    
    //2.根据类生成控制器
    UIViewController *targetVc = [[class alloc] init];
    
    //断言 抛出异常
    NSAssert([targetVc isKindOfClass:[UIViewController class]], @"%@的名字错了",className);
    
    //3.设置内容 title  image
    targetVc.title = title;
    targetVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    //4.嵌套navVc
    UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:targetVc];
    
    return navVc;
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
