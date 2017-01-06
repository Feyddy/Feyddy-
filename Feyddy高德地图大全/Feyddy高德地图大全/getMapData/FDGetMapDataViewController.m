//
//  FDGetMapDataViewController.m
//  Feyddy高德地图大全
//
//  Created by 徐忠林 on 06/01/2017.
//  Copyright © 2017 feyddy. All rights reserved.
//

#import "FDGetMapDataViewController.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapSearchKit/AMapSearchKit.h>


@interface FDGetMapDataViewController ()<AMapSearchDelegate>
@property (nonatomic ,strong) AMapSearchAPI *search;
@end

@implementation FDGetMapDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    构造 AMapSearchAPI
//    构造主搜索对象 AMapSearchAPI，并设置代理。
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.search = [[AMapSearchAPI alloc] init];
    self.search.delegate = self;
    
    
//  设置关键字检索参数:  进行关键字检索的请求参数类为 AMapPOIKeywordsSearchRequest，其中 keywords 是必设参数。
    AMapPOIKeywordsSearchRequest *request = [[AMapPOIKeywordsSearchRequest alloc] init];
    
    request.keywords            = @"北京大学";
    request.city                = @"北京";
    request.types               = @"高等院校";
    request.requireExtension    = YES;
    
    /*  搜索SDK 3.2.0 中新增加的功能，只搜索本城市的POI。*/
    request.cityLimit           = YES;
    request.requireSubPOIs      = YES;
    
    
    
//    发起POI关键字搜索
//    调用 AMapSearchAPI 的 AMapPOIKeywordsSearch 并发起关键字检索。
    [self.search AMapPOIKeywordsSearch:request];
}

/*
 <#subscript#>
 */
/* POI 搜索回调. */
- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response
{
    if (response.pois.count == 0)
    {
        return;
    }
    
    //解析response获取POI信息，具体解析见 Demo
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
