//
//  ZCOpalTabbarVC.m
//  iOS7stylenavigationbar and tabbar
//
//  Created by Jason Zhou on 8/14/14.
//  Copyright (c) 2014 Jason Zhou. All rights reserved.
//

#import "ZCOpalTabbarVC.h"
#import "UIERealTimeBlurView.h"
#import "ZCScrollViewController.h"
#import "ZCOpalNaviVC.h"
#import "ZCOpalTabbarView.h"
#import "ZCtableVIewVC.h"
@interface ZCOpalTabbarVC ()<ZCOpalTabbarViewdelegate>

@property (nonatomic, strong) ZCOpalTabbarView *blurView;

@end

@implementation ZCOpalTabbarVC


///**************************************  life time circle      **************************************
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
   self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UIViewController *opalNaviVC = [[ZCOpalNaviVC alloc] initWithRootViewController:[[ZCScrollViewController alloc] init]];
        [self addChildViewController:opalNaviVC];
        
        UIViewController *secondVC = [[ZCtableVIewVC alloc] init];
        UIViewController *secondnaviVC = [[ZCOpalNaviVC alloc] initWithRootViewController:secondVC];
        [self addChildViewController:secondnaviVC];
        
        
        opalNaviVC.tabBarItem.title = @"real time Bluring";
        
    }
    
    return  self;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _blurView = [[ZCOpalTabbarView alloc] initWithFrame:self.tabBar.bounds];
    
    self.blurView.mydelegate = self;

    NSLog(@"%@", self.tabBar.subviews);
}

- (void)viewWillLayoutSubviews
{
#pragma mark track the image view here... the uiimage view will be removed after 2nd call of lay out subviews.
    
    NSLog(@"%s", __func__);
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self.tabBar addSubview:_blurView];
    });
    NSLog(@"%@", self.tabBar.subviews);

    //    static dispatch_once_t onceToken;
    //    dispatch_once(&onceToken, ^{
    
    [self.tabBar.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UIImageView class]]) {
            [obj removeFromSuperview];
        }
    }];
    
    NSLog(@"%@", self.tabBar.subviews);
    
    //    });
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    NSLog(@"%@", self.tabBar.subviews);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)switchController:(UIButton *)btn
{
    self.selectedIndex = btn.tag;
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
