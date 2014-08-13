//
//  ZCScrollViewController.m
//  iOS7stylenavigationbar and tabbar
//
//  Created by Jason Zhou on 8/14/14.
//  Copyright (c) 2014 Jason Zhou. All rights reserved.
//

#import "ZCScrollViewController.h"

@interface ZCScrollViewController ()

@property (nonatomic, strong)UIScrollView *scrollview;

@end

@implementation ZCScrollViewController

- (void)loadView
{
    self.view = self.scrollview;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"scrollView";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Push&hide" style:UIBarButtonItemStylePlain target:self action:@selector(push:)];
    
//    self.hidesBottomBarWhenPushed = YES;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

///**************************************  LAZZY      **************************************

- (UIScrollView *)scrollview
{
    if (_scrollview == nil) {
        
        _scrollview = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
         UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.jpg"]];
        
        _scrollview.contentSize = imgV.image.size;
        
        [_scrollview addSubview:imgV];
        
    }
    return _scrollview;
}


- (void)push:(UIBarButtonItem *)btn
{
    UIViewController *pushcontroller = [[UIViewController alloc] init];
    
    
    pushcontroller.view.backgroundColor = [UIColor greenColor];
    
    [self.navigationController pushViewController:pushcontroller animated:YES];
    
    
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
