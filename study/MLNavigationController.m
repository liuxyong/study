//
//  MLNavigationController.m
//  TaidaCarInsurance
//
//  Created by BOyka on 14/12/9.
//  Copyright (c) 2014年 BOyka. All rights reserved.
//

#import "MLNavigationController.h"

@interface MLNavigationController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

//重写父类的三个方法,push推送下个类，移除一个类，移除到根类
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated;

@end

@implementation MLNavigationController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    [self initializelocatePlaceView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //是否支持interactivePopGestureRecognizer方法，因为7.0之后，才会有右滑返回上个页面的方法
    __weak MLNavigationController *weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //判断是否是某个类
//    NSUInteger count = self.viewControllers.count;
//    UIViewController *viewExihit = self.topViewController;
//    
//    if (count == 1 && [viewExihit isMemberOfClass:[WelcomeViewConroller class]]) {
//        self.dragView.alpha = 1.0f;
//        [self.dragView show];
//    }
}

// Hijack the push method to disable the gesture
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]&&animated==YES)
        self.interactivePopGestureRecognizer.enabled = NO;
    [super pushViewController:viewController animated:animated];
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]&&animated==YES)
        self.interactivePopGestureRecognizer.enabled = NO;
    return [super popToRootViewControllerAnimated:animated];
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
        self.interactivePopGestureRecognizer.enabled = NO;
    return [super popToViewController:viewController animated:animated];
}

#pragma mark - UINavigationControllerDelegate
//将要显示viewController的时候判断是否支持手势右滑方法的功能,如果支持的话，打开
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animate {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]){
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}

#pragma mark - UIGestureRecognizerDelegate
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer==self.interactivePopGestureRecognizer) {
        //navigation里面一共有几个viewcontroller的数量小于2，并且是现在显示的是第一个viewcontroller
//        int count = self.viewControllers.count;
        if (self.viewControllers.count<1||self.visibleViewController==[self.viewControllers objectAtIndex:0]) {
            return NO;
        }
    }
    return YES;
}

/**
 *  主菜单点击按钮
 */
//- (void)showMenu
//{
//    // Dismiss keyboard (optional)
//    //
//    [self.view endEditing:YES];
//    [self.frostedViewController.view endEditing:YES];
//    
//    // Present the view controller
//    //
//    [self.frostedViewController presentMenuViewController];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 屏幕旋转
//是否支持自动旋转
- (BOOL)shouldAutorotate {
    return NO;
}

//只支持竖屏
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
