//
//  HeroTimeViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroTimeViewController.h"
#import "HeroTimeDetailViewController.h"
@interface HeroTimeViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation HeroTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [Factory addMenuItemToVC:self];
    
    self.title = @"英雄时刻";

}
- (UIWebView *)webView {
    if(_webView == nil) {
        _webView = [[UIWebView alloc] init];
        NSString *path = @"http://qt.qq.com/php_cgi/lol_mobile/hero_time/tpl/navigation.html?area=20&APP_BROWSER_VERSION_CODE=1&ios_version=665#hot";
        
        
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:path]]];
        NSLog(@"AAA %@",_webView.request);
        _webView.delegate = self;
    }
    return _webView;
}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *path1 = @"http://qt.qq.com/php_cgi/lol_mobile/hero_time/tpl/navigation.html?area=20&APP_BROWSER_VERSION_CODE=1&ios_version=665#hot";
    NSString *path2 = @"http://qt.qq.com/php_cgi/lol_mobile/hero_time/tpl/navigation.html?area=20&APP_BROWSER_VERSION_CODE=1&ios_version=665#new";
    NSString *path3 = @"http://qt.qq.com/php_cgi/lol_mobile/hero_time/tpl/navigation.html?area=20&APP_BROWSER_VERSION_CODE=1&ios_version=665#friend";
    NSString *path4 = @"http://qt.qq.com/php_cgi/lol_mobile/hero_time/tpl/navigation.html?area=20&APP_BROWSER_VERSION_CODE=1&ios_version=665#my";
    
//        点击web中的任意一项 跳转到下一页
    if (![request.URL.absoluteString isEqualToString:path1] && ![request.URL.absoluteString isEqualToString:path2] && ![request.URL.absoluteString isEqualToString:path3] && ![request.URL.absoluteString isEqualToString:path4]) {
        HeroTimeDetailViewController *vc = [[HeroTimeDetailViewController alloc]initWithRequest:request];
        NSLog(@"网址 %@",request);
        [self.navigationController pushViewController:vc animated:YES];
       
        return NO;
    }
    

    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self showProgress];//旋转提示
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self hideProgress];
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
