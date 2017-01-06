//
//  FDAnnotationView.m
//  Feyddy高德地图大全
//
//  Created by t3 on 17/1/5.
//  Copyright © 2017年 feyddy. All rights reserved.
//

#import "FDAnnotationView.h"

@interface FDAnnotationView ()

@property (nonatomic, strong, readwrite) FDCalloutView *calloutView;

@end


@implementation FDAnnotationView

#define kCalloutWidth       200.0
#define kCalloutHeight      70.0


//重写选中方法setSelected。选中时新建并添加calloutView，传入数据；非选中时删除calloutView。
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if (self.selected == selected)
    {
        return;
    }
    
    if (selected)
    {
        if (self.calloutView == nil)
        {
            self.calloutView = [[FDCalloutView alloc] initWithFrame:CGRectMake(0, 0, kCalloutWidth, kCalloutHeight)];
            self.calloutView.center = CGPointMake(CGRectGetWidth(self.bounds) / 2.f + self.calloutOffset.x,
                                                  -CGRectGetHeight(self.calloutView.bounds) / 2.f + self.calloutOffset.y);
        }
        
        self.calloutView.image = [UIImage imageNamed:@"mark"];
        self.calloutView.title = self.annotation.title;
        self.calloutView.subtitle = self.annotation.subtitle;
        
        [self addSubview:self.calloutView];
    }
    else
    {
        [self.calloutView removeFromSuperview];
    }
    
    [super setSelected:selected animated:animated];
}

@end
