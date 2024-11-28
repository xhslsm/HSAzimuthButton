//
//  HSAzimuthButton.m
//  HS-Beauty
//
//  Created by 123 on 2024/9/14.
//

#import "HSAzimuthButton.h"

@interface HSAzimuthButton()

/**
 背景图
 */
@property (nonatomic, strong) UIImageView *backgroundImageView;

@end

@implementation HSAzimuthButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI{
    _contentMarin = 16;
    _titleMarin = 2;
    _azimuthButtonDirection = HSAzimuthButtonCenter;
    
    [self addSubview:self.backgroundImageView];
    [self addSubview:self.mainTitleLabel];
    [self addSubview:self.subTitleLabel];
    
    [self addConstraint];
    [self updateLableConstraint];
}

#pragma mark --Public
- (void)setAzimuthButtonDirection:(HSAzimuthButtonDirection)azimuthButtonDirection{
    _azimuthButtonDirection = azimuthButtonDirection;
    [self updateLableConstraint];
}

- (void)setContentMarin:(CGFloat)contentMarin{
    _contentMarin = contentMarin;
    [self updateLableConstraint];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage{
    _backgroundImage = backgroundImage;
    self.backgroundImageView.image = backgroundImage;
}

#pragma mark --约束
- (void)addConstraint{
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)updateLableConstraint{
    CGFloat margin = _contentMarin;
    
    switch (_azimuthButtonDirection) {
        case HSAzimuthButtonCenter:{
            //居中
            [self.mainTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.greaterThanOrEqualTo(self);
                make.right.lessThanOrEqualTo(self);
                make.centerX.equalTo(self);
                make.bottom.equalTo(self.mas_centerY).offset(-_titleMarin/2);
            }];
            
            [self.subTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.greaterThanOrEqualTo(self);
                make.right.lessThanOrEqualTo(self);
                make.top.equalTo(self.mas_centerY).offset(_titleMarin/2);
                make.centerX.equalTo(self.mainTitleLabel);
            }];
        }
            break;
        case HSAzimuthButtonTop:{
            //上方
            [self.mainTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.greaterThanOrEqualTo(self);
                make.right.lessThanOrEqualTo(self);
                make.centerX.equalTo(self);
                make.top.equalTo(self).offset(margin);
            }];
            
            [self.subTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.greaterThanOrEqualTo(self);
                make.right.lessThanOrEqualTo(self);
                make.top.equalTo(self.mainTitleLabel.mas_bottom).offset(_titleMarin);
                make.centerX.equalTo(self.mainTitleLabel);
            }];
        }
            break;
        case HSAzimuthButtonTopLeft:{
            //左上
            [self.mainTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(margin);
                make.right.lessThanOrEqualTo(self);
                make.top.equalTo(self).offset(margin);
            }];
            
            [self.subTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mainTitleLabel);
                make.right.lessThanOrEqualTo(self);
                make.top.equalTo(self.mainTitleLabel.mas_bottom).offset(_titleMarin);
            }];
        }
            break;
        case HSAzimuthButtonLeft:{
            //左
            [self.mainTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(margin);
                make.right.lessThanOrEqualTo(self);
                make.bottom.equalTo(self.mas_centerY).offset(-_titleMarin/2);;
            }];
            
            [self.subTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mainTitleLabel);
                make.right.lessThanOrEqualTo(self);
                make.top.equalTo(self.mainTitleLabel.mas_bottom).offset(_titleMarin/2);
            }];
        }
            break;
        case HSAzimuthButtonBottomLeft:{
            //下左
            [self.subTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(margin);
                make.right.lessThanOrEqualTo(self);
                make.bottom.equalTo(self).offset(-margin);
            }];
            
            [self.mainTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.subTitleLabel);
                make.right.lessThanOrEqualTo(self);
                make.bottom.equalTo(self.subTitleLabel.mas_top).offset(-_titleMarin);
            }];
            
        }
            break;
        case HSAzimuthButtonBottom:{
            //下
            [self.subTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.greaterThanOrEqualTo(self);
                make.right.lessThanOrEqualTo(self);
                make.centerX.equalTo(self);
                make.bottom.equalTo(self.mas_bottom).mas_offset(-margin);
            }];
            
            [self.mainTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.greaterThanOrEqualTo(self);
                make.right.lessThanOrEqualTo(self);
                make.bottom.equalTo(self.subTitleLabel.mas_top).offset(-_titleMarin);
                make.centerX.equalTo(self.subTitleLabel);
            }];
            
        }
            break;
        case HSAzimuthButtonBottomRight:{
            //下右
            [self.subTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.greaterThanOrEqualTo(self);
                make.right.equalTo(self).offset(-margin);
                make.bottom.equalTo(self).offset(-margin);
            }];
            
            [self.mainTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.greaterThanOrEqualTo(self);
                make.right.equalTo(self.subTitleLabel);
                make.bottom.equalTo(self.subTitleLabel.mas_top).offset(-_titleMarin);
            }];
            
        }
            break;
        case HSAzimuthButtonRight:{
            //右
            [self.mainTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.greaterThanOrEqualTo(self);
                make.right.equalTo(self).offset(-margin);
                make.bottom.equalTo(self.mas_centerY).offset(-_titleMarin/2);
            }];
            
            [self.subTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.greaterThanOrEqualTo(self);
                make.right.equalTo(self.mainTitleLabel);
                make.top.equalTo(self.mainTitleLabel.mas_bottom).offset(_titleMarin/2);
            }];
            
        }
            break;
        case HSAzimuthButtonTopRight:{
            //上右
            [self.mainTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.greaterThanOrEqualTo(self);
                make.right.equalTo(self).offset(-margin);
                make.top.equalTo(self).offset(margin);
            }];
            
            [self.subTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.greaterThanOrEqualTo(self);
                make.right.equalTo(self.mainTitleLabel);
                make.top.equalTo(self.mainTitleLabel.mas_bottom).offset(_titleMarin);
            }];
            
        }
            break;
        default:
            break;
    }
}

#pragma mark -- Lazy
- (UIImageView *)backgroundImageView{
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
    }
    return _backgroundImageView;
}

- (UILabel *)mainTitleLabel{
    if (!_mainTitleLabel) {
        _mainTitleLabel = [[UILabel alloc] init];
        _mainTitleLabel.textColor = [UIColor whiteColor];
        _mainTitleLabel.text = @"主标题";
        _mainTitleLabel.numberOfLines = 2;
        _mainTitleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _mainTitleLabel;
}

- (UILabel *)subTitleLabel{
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.textColor = [UIColor whiteColor];
        _subTitleLabel.text = @"主标题";
        _subTitleLabel.numberOfLines = 2;
        _subTitleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _subTitleLabel;
}
@end
