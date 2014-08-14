//
//  ZCOpalNaviVC.m
//  iOS7stylenavigationbar and tabbar
//
//  Created by Jason Zhou on 8/14/14.
//  Copyright (c) 2014 Jason Zhou. All rights reserved.
//

#import "ZCOpalNaviVC.h"
#import "ZCNaviBlurView.h"
@interface ZCOpalNaviVC ()

@property (nonatomic, strong)ZCNaviBlurView *naviblurView;
@end

@implementation ZCOpalNaviVC

+ (void)initialize
{
    if (self == [ZCOpalNaviVC class]) {
        
        UINavigationBar *naviBar = [UINavigationBar appearance];
        [naviBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        naviBar.shadowImage = [UIImage new];
        naviBar.translucent = YES;
        
//        ZCNaviBlurView *naviblurView = [[ZCNaviBlurView alloc] initWithFrame:naviBar.bounds];
//        
//        [naviBar addSubview:naviblurView];
//        [naviBar sendSubviewToBack:naviblurView];
        
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (ZCNaviBlurView *)naviblurView
{
    if (_naviblurView ==nil) {
        CGFloat y =self.navigationBar.frame.origin.y;
        
        CGRect frame = CGRectMake(0, 0, self.navigationBar.frame.size.width, y + self.navigationBar.frame.size.height);
        
        _naviblurView = [[ZCNaviBlurView alloc] initWithFrame:frame];
        
//        [self.navigationBar addSubview:_naviblurView];
        [self.view insertSubview:_naviblurView belowSubview:self.navigationBar];

        [self.navigationBar sendSubviewToBack:_naviblurView];

        
    }
    return _naviblurView;
}

- (void)viewWillLayoutSubviews
{
    [self naviblurView];
    
    
}


-(void)viewDidLayoutSubviews
{

}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
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
