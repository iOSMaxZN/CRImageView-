//
//  CRImageView.m
//  Demo_设置圆角
//
//  Created by iOSMax on 16/3/5.
//  Copyright © 2016年 iOSMax. All rights reserved.
//

#import "CRImageView.h"
#import "UIImageView+Expand.h"

@implementation CRImageView

- (void)setImage:(UIImage *)image{
    [super setImage:[self ex_imgViewCornerRadius:self.m_cornerRadius andImage:image]];
}

- (void)setM_cornerRadius:(CGFloat)m_cornerRadius{
    self->_m_cornerRadius = m_cornerRadius;
    
    self.image = [self ex_imgViewCornerRadius:m_cornerRadius andImage:self.image];
}

@end
