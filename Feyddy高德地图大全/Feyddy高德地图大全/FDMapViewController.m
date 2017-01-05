//
//  FDMapViewController.m
//  Feyddy高德地图大全
//
//  Created by t3 on 17/1/5.
//  Copyright © 2017年 feyddy. All rights reserved.
//

#import "FDMapViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import "FDAnnotationView.h"

@interface FDMapViewController ()<MAMapViewDelegate>
{
    MAMapView *_mapView;
}
@end

@implementation FDMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"地图模式";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置MAMapView的代理对象
    _mapView.delegate = self;

    
    //创建地图
    [self createMap];
    
    
//    //7、控件交互
//    [self controlInteraction];
//
//    //8、手势交互
//    [self tapInteraction];
//
//    //9、截图
//    [self screenShot];
    
    //10、在地图上绘制点标记
    [self drawRectPointInMap];
    
    //11、在地图上绘制折线
    [self drawRectBrokenLineInMap];
    
    //12、在地图上绘制面
    
}

#pragma mark - 创建地图
- (void)createMap {
    //1、
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
    
    ///初始化地图
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 100, MainScreenWidth, MainScreenHeight - 100)];
    
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
    
    //6、离线地图
}


#pragma mark - 与地图交互-控件交互
- (void)controlInteraction {
//    地图控件可帮您直观的了解当前的地图的状态，iOS SDK提供“地图Logo”、“指南针”和“比例尺”三种地图控件。
//    
//    1、地图logo控件
//    iOS SDK默认的Logo为“高德地图”字样，显示在地图的左下方。地图Logo不能移除，但可通过MAMapView.logoCenter属性来调整Logo的显示位置。在ViewController.m的viewDidLoad方法添加如下如下：
    
    _mapView.logoCenter = CGPointMake(CGRectGetWidth(self.view.bounds)-55, 450);
    
    
//    2、指南针控件
//    指南针默认是开启状态，显示在地图的右上角。
//    通过MAMapView的showsCompass属性用来控制指南针的可见性。compassOrigin属性可改变指南针的显示位置。在ViewController.m的viewDidLoad方法添加如下如下：
    _mapView.showsCompass= YES; // 设置成NO表示关闭指南针；YES表示显示指南针
//
    _mapView.compassOrigin= CGPointMake(_mapView.compassOrigin.x, 22); //设置指南针位置
    
    
//    3、比例尺控件
    
//    在iOS SDK中，比例尺默认显示在地图的左上角。MAMapView的showScale属性用来控制比例尺的可见性，scaleOrigin属性用来改变比例尺的显示位置。在ViewController.m的viewDidLoad方法添加如下代码：

    _mapView.showsScale= YES;  //设置成NO表示不显示比例尺；YES表示显示比例尺
    
    _mapView.scaleOrigin= CGPointMake(_mapView.scaleOrigin.x, 22);  //设置比例尺位置
}





#pragma mark - 与地图交互-手势方法交互
/**
 *  MAMapView.zoomEnabled	此属性用于缩放手势的开启和关闭
 MAMapView.scrollEnabled	此属性用于地图拖动的开启和关闭
 MAMapView.rotateEnabled	此属性用于地图旋转的开启和关闭
 MAMapView.rotateCameraEnabled	此属性用于地图Camera旋转的开启和关闭
 */
- (void)tapInteraction {
//    1、缩放手势
//    缩放手势可改变地图的缩放级别，地图响应的手势如下：
//    双击地图可以使缩放级别增加1 (放大)
//    两个手指捏/拉伸
//    通过MAMapView的scrollEnabled属性可以禁用或启用缩放手势。禁用缩放手势不会影响用户使用地图上的缩放控制按钮。禁用缩放手势的代码如下：
      _mapView.zoomEnabled = YES;    //NO表示禁用缩放手势，YES表示开启
//   地图的缩放级别的范围是[3-19]，调用MAMapView的setZoomLevel方法设置地图的缩放级别，用来缩放地图。示例代码如下：
        [_mapView setZoomLevel:12 animated:YES];
    
    
    
    
//    2、拖动手势
//    您可以用手指拖动地图四处滚动（平移）或用手指滑动地图（动画效果）。
//    通过MAMapView的scrollEnabled属性可以禁用或开启平移（滑动）手势。以下介绍展示如何禁用缩放手势，示例代码如下：

        _mapView.scrollEnabled = YES;    //NO表示禁用滑动手势，YES表示开启
//    地图平移时，缩放级别不变，可通过改变地图的中心点来移动地图，示例代码如下：
//        [_mapView setCenterCoordinate:self.view.center animated:YES];??????????????????
    
    
    
//    3、旋转手势
//    您可以用两个手指在地图上转动，可以旋转3D矢量地图。
//    通过调用类MAMapView的rotateEnabled属性禁用或开启旋转手势。
        _mapView.rotateEnabled= YES;    //NO表示禁用旋转手势，YES表示开启
//    旋转角度的范围是[0.f 360.f]，以逆时针为正向。调用MAMapView的setRotationDegree方法设置地图的旋转角度。示例代码如下：
        [_mapView setRotationDegree:60.f animated:YES duration:0.5];
    
    
    
    
//    4、倾斜手势
//    用户可以在地图上放置两个手指，移动它们一起向下或向上去增加或减小倾斜角。
//    通过MAMapView的rotateCameraEnabled属性禁用或启用倾斜手势。

        _mapView.rotateCameraEnabled= YES;    //NO表示禁用倾斜手势，YES表示开启
//    倾斜角度范围为[0.f, 45.f]，调用MAMapView的setCameraDegree方法设置地图的倾斜角度。示例代码如下：
//                    
        [_mapView setCameraDegree:30.f animated:YES duration:0.5];
    
    
    
    
    
    
//    5、限制地图的显示范围
//    
//    v4.4.0起新增了设置地图显示范围，手机屏幕仅显示设定的地图范围，当前不支持旋转地图的情况，请与"禁用旋转手势"配合使用。
//    
//    使用场景：针对需要展示部分固定范围的地图，如希望设置仅显示北京市区地图，可使用此功能。
//    
//    使用方法如下:
//
//    _boundary =  MACoordinateRegionMake(CLLocationCoordinate2DMake(40, 116), MACoordinateSpanMake(2, 2));
//    MAMapRect mapRect = MAMapRectForCoordinateRegion(_boundary);
//    
//    
//    //注意，不要viewWillAppear里设置
//    [self.mapView setLimitRegion:self.boundary];
}


#pragma mark - 与地图交互-地图截屏
- (void)screenShot {
//    地图截屏功能
//    iOS SDK支持对选定的屏幕地图区域(CGRect)进行截屏，截取的内容包括：地图、地图覆盖物、弹出气泡。
//    说明：地图截屏功能依赖于地图显示，即：只有内容先显示在地图上，才能进行截屏。
//    使用 MAMapView 中的 takeSnapshotInRect 方法进行截屏，该方法返回UIImage对象。示例代码如下：
//    
 
    __block UIImage *screenshotImage = nil;
    __block NSInteger resState = 0;
    [_mapView takeSnapshotInRect:self.view.frame withCompletionBlock:^(UIImage *resultImage, NSInteger state) {
        screenshotImage = resultImage;
        resState = state; // state表示地图此时是否完整，0-不完整，1-完整
    }];
}



#pragma mark - 在地图上绘制 - 绘制点标记
/**
 *  绘制点标记
 *  标注可以精确表示用户需要展示的位置信息，高德地图SDK提供的标注功能允许用户自定义图标和信息窗，同时提供了标注的点击、拖动事件的回调。
 * SDK 提供的地图标注为MAAnnotation类，不同的标记可以根据图标和改变信息窗的样式和内容加以区分。
 *
 *
 */
- (void)drawRectPointInMap {
    
    
     //添加默认样式点标记:iOS SDK提供的大头针标注MAPinAnnotationView，通过它可以设置大头针颜色、是否显示动画、是否支持长按后拖拽大头针改变坐标等。
    
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(39.989631, 116.481018);
    pointAnnotation.title = @"方恒国际";
    pointAnnotation.subtitle = @"阜通东大街6号";
    
    [_mapView addAnnotation:pointAnnotation];
    
    
    //实现 <MAMapViewDelegate> 协议中的 mapView:viewForAnnotation:回调函数，设置标注样式
    
    
    
    
    /**
     *  添加自定义样式点标记 :iOS SDK可自定义标注（包括 自定义标注图标 和 自定义气泡图标），均通过MAAnnotationView来实现。
     *
     *  自定义标注图标
     
     若大头针样式的标注不能满足您的需求，您可以自定义标注图标。步骤如下：
     
     （1） 添加标注数据对象，可参考大头针标注的步骤（1）。
     
     （2） 导入标记图片文件到工程中。这里我们导入一个名为 restauant.png 的图片文件。
     
     （3） 在 <MAMapViewDelegate>协议的回调函数mapView:viewForAnnotation:中修改 MAAnnotationView 对应的标注图片。
     *
     *
     */
    

 
}


#pragma mark - 在地图上绘制 - 绘制折线
/**
 *  绘制折线
 *
 *  折线类为 MAPolyline，由一组经纬度坐标组成，并以有序序列形式建立一系列的线段。iOS SDK支持在3D矢量地图上绘制带箭头或有纹理等样式的折线，同时可设置折线端点和连接点的类型，以满足各种绘制线的场景。
 *
 *
 */
- (void)drawRectBrokenLineInMap {
    //构造折线数据对象
    CLLocationCoordinate2D commonPolylineCoords[4];
    commonPolylineCoords[0].latitude = 39.832136;
    commonPolylineCoords[0].longitude = 116.34095;
    
    commonPolylineCoords[1].latitude = 39.832136;
    commonPolylineCoords[1].longitude = 116.42095;
    
    commonPolylineCoords[2].latitude = 39.902136;
    commonPolylineCoords[2].longitude = 116.42095;
    
    commonPolylineCoords[3].latitude = 39.902136;
    commonPolylineCoords[3].longitude = 116.44095;
    
    //构造折线对象
    MAPolyline *commonPolyline = [MAPolyline polylineWithCoordinates:commonPolylineCoords count:4];
    
    //在地图上添加折线对象
    [_mapView addOverlay: commonPolyline];
}


#pragma mark - 在地图上绘制 - 绘制面
- (void)drawRectPlaneInMap {
    //1、绘制圆
    //圆类为MACircle，圆对象由中心点（经纬度）和半径（米）构成。
    [self drawCirle];
    
    //2、绘制热力图
}

- (void)drawCirle {
    //构造圆
    MACircle *circle = [MACircle circleWithCenterCoordinate:CLLocationCoordinate2DMake(39.952136, 116.50095) radius:5000];
    
    //在地图上添加圆
    [_mapView addOverlay: circle];
}


#pragma mark - MAMapViewDelegate
//自定义标注气泡等
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    //自定义标注图标
//    if ([annotation isKindOfClass:[MAPointAnnotation class]])
//    {
//        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
//        MAAnnotationView *annotationView = (MAAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
//        if (annotationView == nil)
//        {
//            annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation
//                                                          reuseIdentifier:reuseIndetifier];
//        }
//        annotationView.image = [UIImage imageNamed:@"mark"];
//        //设置中心点偏移，使得标注底部中间点成为经纬度对应点
//        annotationView.centerOffset = CGPointMake(0, -18);
//        return annotationView;
//    }
//    return nil;
    
    
    //添加默认样式点标记
//    if ([annotation isKindOfClass:[MAPointAnnotation class]])
//    {
//        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
//        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
//        if (annotationView == nil)
//        {
//            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
//        }
//        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
//        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
//        annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
//        annotationView.pinColor = MAPinAnnotationColorPurple;
//        return annotationView;
//    }
//    return nil;
    
    
    
    //添加自定义气泡FDCalloutView
    
    //添加自定义AnnotationView
    
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
        FDAnnotationView *annotationView = (FDAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[FDAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIndetifier];
        }
        annotationView.image = [UIImage imageNamed:@"restaurant"];
        
        // 设置为NO，用以调用自定义的calloutView
        annotationView.canShowCallout = NO;
        
        // 设置中心点偏移，使得标注底部中间点成为经纬度对应点
        annotationView.centerOffset = CGPointMake(0, -18);
        return annotationView;
    }
    return nil;
    
}

//设置折线样式
- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay
{
    
    //--折线设置
//    if ([overlay isKindOfClass:[MAPolyline class]])
//    {
//        MAPolylineRenderer *polylineRenderer = [[MAPolylineRenderer alloc] initWithPolyline:overlay];
//        
//        polylineRenderer.lineWidth    = 8.f;
//        polylineRenderer.strokeColor  = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.6];
//        polylineRenderer.lineJoinType = kMALineJoinRound;
//        polylineRenderer.lineCapType  = kMALineCapRound;
//        
//        return polylineRenderer;
//    }
//    
//    return nil;
//    
////    在该回调函数中，调用 MAPolylineRenderer 的 loadStrokeTextureImage 方法可以设置折线的纹理图片（仅3D矢量地图支持）。
////    
////    注意：纹理图片必须是正方形，宽高是2的整数幂，如64*64，否则无效；若设置了纹理图片，设置线颜色、连接类型和端点类型将无效，目前仅支持设置折线纹理。
////    
////    设置纹理图片的代码如下：
////    
////    
////    [polylineRenderer loadStrokeTextureImage:[UIImage imageNamed:@"arrowTexture"]];
    
    
    
    //--绘制圆
    if ([overlay isKindOfClass:[MACircle class]])
    {
        MACircleRenderer *circleRenderer = [[MACircleRenderer alloc] initWithCircle:overlay];
        
        circleRenderer.lineWidth    = 5.f;
        circleRenderer.strokeColor  = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.8];
        circleRenderer.fillColor    = [UIColor colorWithRed:1.0 green:0.8 blue:0.0 alpha:0.8];
        return circleRenderer;
    }
    return nil;
}


- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    /* Reset traffic. */
    _mapView.showTraffic = NO;
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
