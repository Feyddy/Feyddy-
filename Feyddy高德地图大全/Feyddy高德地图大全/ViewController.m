//
//  ViewController.m
//  Feyddy高德地图大全
//
//  Created by t3 on 17/1/3.
//  Copyright © 2017年 feyddy. All rights reserved.
//

#import "ViewController.h"
#import "FDMapViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
   
     [[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil];
}



- (IBAction)mapAction:(UIButton *)sender {
    
    FDMapViewController *vc = [[FDMapViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
