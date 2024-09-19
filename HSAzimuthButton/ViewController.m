//
//  ViewController.m
//  HSAzimuthButton
//
//  Created by 123 on 2024/9/18.
//

#import "ViewController.h"
#import "HSAzimuthButton.h"

@interface ViewController ()

@property (nonatomic, strong) HSAzimuthButton *topLeftBtn;
@property (nonatomic, strong) HSAzimuthButton *topRighttBtn;
@property (nonatomic, strong) HSAzimuthButton *bottomLeftBtn;
@property (nonatomic, strong) HSAzimuthButton *bottomRightBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.topLeftBtn];
    [self.view addSubview:self.topRighttBtn];
    [self.view addSubview:self.bottomLeftBtn];
    [self.view addSubview:self.bottomRightBtn];
}

- (HSAzimuthButton *)topLeftBtn{
    if (!_topLeftBtn) {
        UIImage *beautyImage = [UIImage imageNamed:@"home_beautyBackImage"];
        CGFloat btX = 20;
        CGFloat btY = 100;
        CGFloat btW = (self.view.frame.size.width - 2*btX - 10) / 2;
        CGFloat btH = btW * beautyImage.size.height / beautyImage.size.width;
        _topLeftBtn = [[HSAzimuthButton alloc] initWithFrame:CGRectMake(btX, btY, btW, btH)];
        _topLeftBtn.backgroundImage = beautyImage;
        _topLeftBtn.mainTitleLabel.text = @"小鸟依人";
        _topLeftBtn.subTitleLabel.text = @"左上角";
        _topLeftBtn.azimuthButtonDirection = HSAzimuthButtonTopLeft;
    }
    return _topLeftBtn;
}

- (HSAzimuthButton *)topRighttBtn{
    if (!_topRighttBtn) {
        UIImage *beautyImage = [UIImage imageNamed:@"home_beautyBackImage"];
        CGFloat btX = CGRectGetMaxX(self.topLeftBtn.frame) + 10;
        CGFloat btY = CGRectGetMinY(self.topLeftBtn.frame);
        CGFloat btW = self.topLeftBtn.frame.size.width;
        CGFloat btH = btW * beautyImage.size.height / beautyImage.size.width;
        _topRighttBtn = [[HSAzimuthButton alloc] initWithFrame:CGRectMake(btX, btY, btW, btH)];
        _topRighttBtn.backgroundImage = beautyImage;
        _topRighttBtn.mainTitleLabel.text = @"小鸟依人";
        _topRighttBtn.subTitleLabel.text = @"右上角";
        _topRighttBtn.azimuthButtonDirection = HSAzimuthButtonTopRight;
    }
    return _topRighttBtn;
}

- (HSAzimuthButton *)bottomLeftBtn{
    if (!_bottomLeftBtn) {
        UIImage *beautyImage = [UIImage imageNamed:@"home_beautyBackImage"];
        CGFloat btX = 20;
        CGFloat btY = CGRectGetMaxY(self.topLeftBtn.frame) + 10;
        CGFloat btW = (self.view.frame.size.width - 2*btX - 10) / 2;
        CGFloat btH = btW * beautyImage.size.height / beautyImage.size.width;
        _bottomLeftBtn = [[HSAzimuthButton alloc] initWithFrame:CGRectMake(btX, btY, btW, btH)];
        _bottomLeftBtn.backgroundImage = beautyImage;
        _bottomLeftBtn.mainTitleLabel.text = @"小鸟依人";
        _bottomLeftBtn.subTitleLabel.text = @"左下角";
        _bottomLeftBtn.azimuthButtonDirection = HSAzimuthButtonBottomLeft;
    }
    return _bottomLeftBtn;
}

- (HSAzimuthButton *)bottomRightBtn{
    if (!_bottomRightBtn) {
        UIImage *beautyImage = [UIImage imageNamed:@"home_beautyBackImage"];
        CGFloat btX = CGRectGetMinX(self.topRighttBtn.frame);
        CGFloat btY = CGRectGetMaxY(self.topRighttBtn.frame) + 10;
        CGFloat btW = self.topRighttBtn.frame.size.width;
        CGFloat btH = btW * beautyImage.size.height / beautyImage.size.width;
        _bottomRightBtn = [[HSAzimuthButton alloc] initWithFrame:CGRectMake(btX, btY, btW, btH)];
        _bottomRightBtn.backgroundImage = beautyImage;
        _bottomRightBtn.mainTitleLabel.text = @"小鸟依人";
        _bottomRightBtn.subTitleLabel.text = @"右下角";
        _bottomRightBtn.azimuthButtonDirection = HSAzimuthButtonBottomRight;
    }
    return _bottomRightBtn;
}
@end
