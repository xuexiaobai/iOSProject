//
//  SINMessageViewController.m
//  PLMMPRJK
//
//  Created by HuXuPeng on 2017/5/11.
//  Copyright © 2017年 GoMePrjk. All rights reserved.
//

#import "SINMessageViewController.h"

@interface SINMessageViewController ()

/** <#digest#> */
@property (weak, nonatomic) SINUnLoginRegisterView *unLoginRegisterView;

@end

@implementation SINMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([SINUserManager sharedManager].isLogined) {
//        self.tableView.hidden = NO;
        self.unLoginRegisterView.hidden = YES;
    }else
    {
//        self.tableView.hidden = YES;
        self.unLoginRegisterView.hidden = NO;
//        [self endHeaderFooterRefreshing];
    }
}



#pragma mark - getter

- (SINUnLoginRegisterView *)unLoginRegisterView
{
    if(_unLoginRegisterView == nil)
    {
        LMJWeak(self);
        SINUnLoginRegisterView *unLoginRegisterView = [SINUnLoginRegisterView unLoginRegisterViewWithType:SINUnLoginRegisterViewTypeMsgPage registClick:^{
            
            [weakself gotoLogin];
            
        } loginClick:^{
            
            [weakself gotoLogin];
            
        }];
        
        
        [self.view addSubview:unLoginRegisterView];
        _unLoginRegisterView = unLoginRegisterView;
        
        
        [unLoginRegisterView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.offset(0);
        }];
        
    }
    return _unLoginRegisterView;
}

- (void)gotoLogin
{
    [[SINUserManager sharedManager] sinaLogin:^(NSError *error) {
        
        if (!error) {
            
            self.unLoginRegisterView.hidden = YES;
        }
        
    }];
    
}


@end
