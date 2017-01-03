//
//  ViewController.m
//  Feyddy高德地图大全
//
//  Created by t3 on 17/1/3.
//  Copyright © 2017年 feyddy. All rights reserved.
//

#import "ViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

#define MainScreenHeight [UIScreen mainScreen].bounds.size.height
#define MainScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.title = @"地图模式";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //1、
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
    
    ///初始化地图
    MAMapView *_mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 100, MainScreenWidth, MainScreenHeight - 100)];
    
    ///把地图添加至view
    [self.view addSubview:_mapView];
    
    //2、
    ///如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    
    //3、
    _mapView.showsIndoorMap = YES;    //YES：显示室内地图；NO：不显示；
    
    //4、
    //设置底图种类为标准地图
    [_mapView setMapType:MAMapTypeStandard];
//    //设置底图种类为卫星地图
//    [_mapView setMapType:MAMapTypeSatellite];
    
//    //设置底图种类为夜景模式地图
//    [_mapView setMapType:MAMapTypeStandardNight];
//    
//    //设置底图种类为导航模式地图
//    [_mapView setMapType:MAMapTypeNavi];
    
//
//    //设置底图种类为公交视图
//    [_mapView setMapType:MAMapTypeBus];
    
    
    
    //5、
    //设置路况
     _mapView.showTraffic = YES;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
