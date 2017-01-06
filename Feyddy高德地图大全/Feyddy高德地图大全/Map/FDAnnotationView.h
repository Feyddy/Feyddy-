//
//  FDAnnotationView.h
//  Feyddy高德地图大全
//
//  Created by t3 on 17/1/5.
//  Copyright © 2017年 feyddy. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
#import "FDCalloutView.h"

@interface FDAnnotationView : MAAnnotationView
@property (nonatomic, readonly) FDCalloutView *calloutView;
@end
