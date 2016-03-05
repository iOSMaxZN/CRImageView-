//
//  ViewController.m
//  Demo_设置圆角
//
//  Created by iOSMax on 16/3/5.
//  Copyright © 2016年 iOSMax. All rights reserved.
//

#import "ViewController.h"

#import "CRImageView.h"

#import "UIImageView+WebCache.h"

#define PhotoUrlStr @"http://pic5.duowan.com/news/1207/206536079760/206536079776.jpg"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *m_tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UITableView *tableView = [[UITableView alloc] initWithFrame:
                              CGRectMake(0, 20, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 20)
                                                          style:UITableViewStyleGrouped];
    
    tableView.delegate        = self;
    tableView.dataSource      = self;
    tableView.rowHeight       = 70.f;
    tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    tableView.tableFooterView = [[UIView alloc] init];
    
    [self.view addSubview:tableView];
    
    self.m_tableView = tableView;
}

#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return section == 0 ? @"使用masksToBounds" : @"未使用masksToBounds";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (indexPath.section == 0) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 50, 50)];
        
        imgView.layer.cornerRadius  = 25.f;
        imgView.layer.masksToBounds = true;
        imgView.contentMode         = UIViewContentModeScaleAspectFill;
        
        [imgView sd_setImageWithURL:[NSURL URLWithString:PhotoUrlStr] placeholderImage:[UIImage imageNamed:@"A.jpg"]];
        
        [cell.contentView addSubview:imgView];
    }
    if (indexPath.section == 1) {
        CRImageView *imgView = [[CRImageView alloc] initWithFrame:CGRectMake(15, 10, 50, 50)];
        
        imgView.m_cornerRadius = 25.f;
        imgView.contentMode    = UIViewContentModeScaleAspectFill;
        
        [imgView sd_setImageWithURL:[NSURL URLWithString:PhotoUrlStr] placeholderImage:[UIImage imageNamed:@"A.jpg"]];
        
        [cell.contentView addSubview:imgView];
    }
    
    return cell;
}

@end
