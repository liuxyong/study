//
//  ViewController.m
//  study
//
//  Created by Sam Liu on 2016/11/2.
//  Copyright © 2016年 Sam Liu. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import <UIImageView+WebCache.h>
@interface ViewController ()<NSURLSessionDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 200, 100, 100);
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(GoToNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(100, 350, self.view.frame.size.width-200, 300)];
    [self.view addSubview:image];
    https://oa.shanghai.brisc.net.cn/tess/upload/images/14/147/th1/1474614962_mBJ.jpg
    //http://d.hiphotos.baidu.com/zhidao/pic/item/4ec2d5628535e5dd5c955af875c6a7efce1b6258.jpg
    [image sd_setImageWithURL:[NSURL URLWithString:@"https://oa.shanghai.brisc.net.cn/tess/upload/images/14/147/th1/1474614962_mBJ.jpg"] placeholderImage:[UIImage imageNamed:@"default"] options:SDWebImageAllowInvalidSSLCertificates];
    
}

-(void)GoToNext{
    NextViewController *NVC = [[NextViewController alloc]init];
    [self.navigationController pushViewController:NVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
