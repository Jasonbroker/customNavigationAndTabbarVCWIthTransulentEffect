//
//  ZCOpalTabbarView.h
//  iOS7stylenavigationbar and tabbar
//
//  Created by Jason Zhou on 8/14/14.
//  Copyright (c) 2014 Jason Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIERealTimeBlurView.h"
@class ZCOpalTabbarView;

@protocol  ZCOpalTabbarViewdelegate<NSObject>

- (void)switchController:(UIButton *)btn;

@end

@interface ZCOpalTabbarView : UIERealTimeBlurView

@property (nonatomic, weak)id mydelegate;

@end
