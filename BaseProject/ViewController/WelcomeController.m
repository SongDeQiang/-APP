//
//  WelcomeController.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WelcomeController.h"
#import "UIView+Extension.h"
#import "InformationViewController.h"
#import "AppDelegate.h"
#import "LeftViewController.h"

#define IMAGECOUNT 5
@interface WelcomeController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIPageControl *pageControl;
@end

@implementation WelcomeController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //1.创建滚动视图实例
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    // 设置滚动视图的代理
    scrollView.delegate = self;
    scrollView.frame = self.view.bounds;
    
    //2.添加滚动视图到self.view中
    [self.view addSubview:scrollView];
    
    //3.配置滚动视图
    //配置边缘不可以弹跳
    scrollView.bounces = NO;
    
    //设置整页滚动
    scrollView.pagingEnabled = YES;
    
    //设置水平滚动条不可见
    scrollView.showsHorizontalScrollIndicator = NO;
    
    //竖直方向不想滚动则可以设置为0
    scrollView.contentSize = CGSizeMake(IMAGECOUNT*scrollView.width, 0);
    //向滚动视图内添加子视图
    for (NSInteger i=0; i<IMAGECOUNT; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        
       
        NSString *imageName = [NSString stringWithFormat:@"guideR4_%ld.jpg",i];
        NSLog(@"AA %@",imageName);
        imageView.image = [UIImage imageNamed:imageName];
       
        imageView.size = scrollView.size;
        imageView.x = i*scrollView.width;
        
        
        [scrollView addSubview:imageView];
        
        //针对最后一个图片视图添加“进入应用”按钮
        if (i==(IMAGECOUNT-1)) {
            [self setupEnterButton:imageView];
        }
        
    }
    
}





//配置最后一页的 进入应用  按钮
-(void)setupEnterButton:(UIImageView *)imageView
{
    //预备：开始图片的用户交互功能
    imageView.userInteractionEnabled = YES;
    
    // 1.创建按钮
    UIButton *enterButton = [[UIButton alloc]init];
    [imageView addSubview:enterButton];
    [enterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];

    enterButton.backgroundColor = [UIColor clearColor];
    
    [enterButton addTarget:self action:@selector(enterApp) forControlEvents:UIControlEventTouchUpInside];
    

    
}
-(void)enterApp
{
    
    RESideMenu *side =[[RESideMenu alloc]initWithContentViewController:[InformationViewController standardTuWanNavi] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
    side.backgroundImage =[UIImage imageNamed:@"hero_top_bg.jpg"];

    side.bouncesHorizontally = NO;
    //为了在进入主界面后，welcome界面从内存中被释放
    //所以需要更换window的根视图控制为side
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController= side;
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
