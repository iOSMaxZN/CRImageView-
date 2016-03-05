//
//  UIImageView+Expand.m
//  Demo_设置圆角
//
//  Created by iOSMax on 16/3/5.
//  Copyright © 2016年 iOSMax. All rights reserved.
//

#import "UIImageView+Expand.h"

@implementation UIImageView (Expand)

- (UIImage *)ex_imgViewCornerRadius:(CGFloat)radius andImage:(UIImage *)image{
    
    if (!image) return nil;

    CGRect bounds = self.bounds;
    
    UIGraphicsBeginImageContextWithOptions(bounds.size, false, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //生成圆角 路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    
    CGContextAddPath(context, path.CGPath);
    
    //裁剪
    CGContextClip(context);
    
    //填充试图
    [image drawInRect:[self getImageFitDrawRect:image withContentMode:self.contentMode]];
    
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImg;
}

/** 根据内容模式 获取Img渲染区间 */
- (CGRect)getImageFitDrawRect:(UIImage *)image withContentMode:(UIViewContentMode)mode{
    CGSize size    = image.size;
    
    if (mode == UIViewContentModeScaleToFill)
        return self.bounds;
    
    CGFloat scale = 1;
    
    if (mode == UIViewContentModeCenter)
        scale = 1;
    
    if (mode == UIViewContentModeScaleAspectFill)
        scale = MIN(size.width/CGRectGetWidth(self.frame), size.height/CGRectGetHeight(self.frame));
        
    if (mode == UIViewContentModeScaleAspectFit)
        scale = MAX(size.width/CGRectGetWidth(self.frame), size.height/CGRectGetHeight(self.frame));
    
    
    CGFloat W = size.width/scale, H = size.height/scale;
    CGRect frame = CGRectMake(CGRectGetWidth(self.frame)/2 - W/2, CGRectGetHeight(self.frame)/2 - H/2, W, H);
    
    return frame;
}

@end
