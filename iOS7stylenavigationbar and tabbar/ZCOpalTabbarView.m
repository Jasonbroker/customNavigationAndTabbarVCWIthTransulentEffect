//
//  ZCOpalTabbarView.m
//  iOS7stylenavigationbar and tabbar
//
//  Created by Jason Zhou on 8/14/14.
//  Copyright (c) 2014 Jason Zhou. All rights reserved.
//

#import "ZCOpalTabbarView.h"
#import "UIERealTimeBlurView.h"

@interface ZCOpalTabbarView()

@property (nonatomic,assign)int btnCount;

@property (nonatomic, strong) NSMutableArray *btns;

@end

@implementation ZCOpalTabbarView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupBtns];
        
    }
    return self;
}

- (void)setupBtns
{
    _btnCount = 2;
    _btns = [NSMutableArray arrayWithCapacity:2];
    
    for (int i = 0 ; i <_btnCount ; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self addSubview:btn];
        btn.tag = i;
        [btn setTitle:[NSString stringWithFormat:@"Button%@", @(i+1)] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_btns addObject:btn];
        
        
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchDown];
        
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width / _btnCount;
    [_btns enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
       
        [(UIButton *)obj setFrame:CGRectMake(idx * width, 0, width, height)];
        
    }];
    
    NSLog(@"------ --  --  -%@", self.subviews);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)btnclick:(UIButton *)btn
{
    NSLog(@"No%@ button clicked ", @(btn.tag));
    
    if ([self.mydelegate respondsToSelector:@selector(switchController:)]) {
        [self.mydelegate switchController:btn];
    }
}

@end









