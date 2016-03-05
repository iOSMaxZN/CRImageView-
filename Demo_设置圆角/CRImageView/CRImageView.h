//
//  CRImageView.h
//  Demo_设置圆角
//
//  Created by iOSMax on 16/3/5.
//  Copyright © 2016年 iOSMax. All rights reserved.
//

//  自动获取 对应模式的裁剪后圆角图片 避免开启masksToBounds、clipsToBounds
//  背景色 无法 裁剪 背景色需要裁剪开启（cornerRadius）
//  只有将 mask 应用到图层，CoreAnimation 才会强制进行离屏渲染

#import <UIKit/UIKit.h>

@interface CRImageView : UIImageView

/** 圆角半径 */
@property (nonatomic, assign) CGFloat m_cornerRadius;

@end
