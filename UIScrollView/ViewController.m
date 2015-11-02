//
//  ViewController.m
//  UIScrollView
//
//  Created by Do Minh Hai on 11/2/15.
//  Copyright (c) 2015 Do Minh Hai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView* scrollView;

@end

@implementation ViewController

{
    UIImageView* photo;
    UIView* NaviView;
    UILabel* zoomLabel;
    UILabel* titleLabel;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.title = @"UIScrollView";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    photo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"images.jpg"]];
    [self.scrollView addSubview:photo];
    self.scrollView.delegate = self;
    self.scrollView.minimumZoomScale = 0.2;
    self.scrollView.maximumZoomScale = 4.0;
    [self.view addSubview:self.scrollView];
    
     NaviView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60)];
    
    zoomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    zoomLabel.center = CGPointMake(self.view.bounds.size.width-30, 30);
    zoomLabel.font = [UIFont boldSystemFontOfSize:20];
    zoomLabel.textColor=[UIColor blackColor];
    //zoomLabel.text =@" Zoom";
    zoomLabel.text = [NSString stringWithFormat:@"%2.2f",self.scrollView.zoomScale];
    [NaviView addSubview:zoomLabel];
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 130, 50)];
    titleLabel.center = CGPointMake(self.view.bounds.size.width/2, 30);
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.text = @"UIScrollView";
    [NaviView addSubview:titleLabel];
    
    self.navigationItem.titleView = NaviView;
    
    
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return photo;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    zoomLabel.text = [NSString stringWithFormat:@"%2.2f",self.scrollView.zoomScale];
    NSLog(@"%2.2f" , self.scrollView.zoomScale);
}
@end
