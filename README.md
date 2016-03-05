# CRImageView-
自带Image圆角 裁剪的 UIImageView 避免离屏渲染

使用
#import "CRImageView.h"

CRImageView *imgView = [[CRImageView alloc] initWithFrame:CGRectMake(15, 10, 50, 50)];

imgView.m_cornerRadius = 25.f;

说明

自动获取 对应模式的裁剪后圆角图片 避免开启masksToBounds、clipsToBounds

背景色 无法 裁剪 背景色需要裁剪开启（cornerRadius）

只有将 mask 应用到图层，CoreAnimation 才会强制进行离屏渲染
