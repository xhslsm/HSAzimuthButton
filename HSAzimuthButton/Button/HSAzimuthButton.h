//
//  HSAzimuthButton.h
//  HS-Beauty
//  许华生
//  Created by 123 on 2024/9/14.
//

/**
 自定义按钮HSAzimuthButton
 显示双标题，调整标题的显示的位置方向及其间隔
 */
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, HSAzimuthButtonDirection) {
    HSAzimuthButtonTopLeft,
    HSAzimuthButtonLeft,
    HSAzimuthButtonBottomLeft,
    HSAzimuthButtonBottom,
    HSAzimuthButtonBottomRight,
    HSAzimuthButtonRight,
    HSAzimuthButtonTopRight,
    HSAzimuthButtonTop,
    HSAzimuthButtonCenter,
};

@interface HSAzimuthButton : UIControl

/**
 主标题
 */
@property (nonatomic, strong) UILabel *mainTitleLabel;
/**
 副标题
 */
@property (nonatomic, strong) UILabel *subTitleLabel;
/**
 背景图片
 */
@property (nonatomic, strong) UIImage *backgroundImage;
/**
 文本的位置
 */
@property (nonatomic, assign) HSAzimuthButtonDirection azimuthButtonDirection;
/**
  contentMarin 文本与方向位置边界的间隔距离
 默认值：16px
 */
@property (nonatomic, assign) CGFloat contentMarin;

@end

NS_ASSUME_NONNULL_END
