//
//  ViewController.m
//  AspectRatio
//
//  Created by ranjith on 07/10/15.
//  Copyright © 2015 ranjith. All rights reserved.
//

#import "ViewController.h"

#import "PHPageScrollView.h"

@interface ViewController ()<PHPageScrollViewDataSource, PHPageScrollViewDelegate>
@property (weak, nonatomic) IBOutlet PHPageScrollView *pageScrollView;

@property (nonatomic,strong) NSArray *dataSource;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageScrollView.delegate = self;
    self.pageScrollView.dataSource = self;
    [self loadBundleImages];
}

- (void)viewDidLayoutSubviews {
    [self.pageScrollView reloadData];
}

#pragma mark - PageScrollView delegates

- (NSInteger)numberOfPageInPageScrollView:(PHPageScrollView*)pageScrollView {
    return self.dataSource.count;
}

- (CGSize)sizeCellForPageScrollView:(PHPageScrollView*)pageScrollView {
    return CGSizeMake(self.pageScrollView.bounds.size.width, (self.pageScrollView.bounds.size.width*9)/16);
}

- (UIView*)pageScrollView:(PHPageScrollView*)pageScrollView viewForRowAtIndex:(int)index {
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.pageScrollView.bounds.size.width, self.pageScrollView.bounds.size.height)];
    imageView.layer.shadowColor = [UIColor blackColor].CGColor;
    imageView.layer.shadowOffset = CGSizeMake(1,1);
    imageView.layer.shadowOpacity = 0.3;
    imageView.image = [self.dataSource objectAtIndex:index];
    return imageView;
}

- (void)pageScrollView:(PHPageScrollView*)pageScrollView didScrollToPageAtIndex:(NSInteger)index {
    self.pageControl.currentPage=index;
}

- (void)pageScrollView:(PHPageScrollView*)pageScrollView willScrollToPageAtIndex:(NSInteger)index {}

- (void)pageScrollView:(PHPageScrollView *)pageScrollView didTapPageAtIndex:(NSInteger)index {
    NSLog(@"%@",[self.dataSource objectAtIndex:index]);
}

- (void)loadBundleImages {
    if(!_dataSource) {
        UIImage *image = [UIImage imageNamed:@"Thyrocare-444x250-30kb.jpg"];
        UIImage *image2 = [UIImage imageNamed:@"Commonfloor-444x250-30kb-2.jpg"];
        _dataSource = [NSArray arrayWithObjects:image,image2, nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
