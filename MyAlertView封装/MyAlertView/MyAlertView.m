//
//  MyAlertView.m
//  CCTVSE
//
//  Created by ctvit on 2017/4/1.
//  Copyright © 2017年 person. All rights reserved.
//

#import "MyAlertView.h"
#import "UIColor+ColorHexString.h"
#import "UIViewExt.h"

#define  ScreenWidth [UIScreen mainScreen].bounds.size.width
#define  ScreenHeight [UIScreen mainScreen].bounds.size.height
@implementation MyAlertView

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:@"343D5E"];
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = YES;
        
        //标题
        _titleLb=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 50)];
        _titleLb.textAlignment=NSTextAlignmentCenter;
        _titleLb.font = [UIFont systemFontOfSize:24];
        _titleLb.textColor=[UIColor colorWithHexString:@"ffffff"];
//        [self addSubview:_titleLb];
        //内容
        _contentLb=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.height - 55)];
        _contentLb.textAlignment=NSTextAlignmentCenter;
        _contentLb.numberOfLines = 2;
        _contentLb.font = [UIFont systemFontOfSize:17];
        _contentLb.textColor=[UIColor colorWithHexString:@"ffffff"];
        [self addSubview:_contentLb];
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, self.bottom-55, self.bounds.size.width, 1)];
        line.backgroundColor = [UIColor colorWithHexString:@"4D5984"];
        [self addSubview:line];
        
        
        
        //取消按钮
        _cancelBt=[[UIButton alloc]initWithFrame:CGRectMake(0, self.bottom-55, self.width/2, 55)];
//        _cancelBt.alpha = 0.8;
//        _cancelBt.layer.cornerRadius = 5;
//        _cancelBt.layer.masksToBounds = YES;
        _cancelBt.titleLabel.font = [UIFont systemFontOfSize:17];
        [_cancelBt setTitleColor:[UIColor colorWithHexString:@"FFFFFF"] forState:UIControlStateNormal];
        [_cancelBt addTarget:self action:@selector(cancelBtClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_cancelBt];
        
        UIView *colline = [[UIView alloc]initWithFrame:CGRectMake(_cancelBt.right-0.5, self.bottom-55, 1, 55)];
        colline.backgroundColor = [UIColor colorWithHexString:@"4D5984"];
        [self addSubview:colline];
        
        //确定按钮
        _sureBt=[[UIButton alloc]initWithFrame:CGRectMake(self.width/2, self.bottom-55, self.width/2, 55)];
//        _sureBt.alpha = 0.8;
//        _sureBt.layer.cornerRadius = 5;
//        _sureBt.layer.masksToBounds = YES;
        _sureBt.titleLabel.font = [UIFont systemFontOfSize:17];
        [_sureBt setTitleColor:[UIColor colorWithHexString:@"FFFFFF"] forState:UIControlStateNormal];
        [_sureBt addTarget:self action:@selector(sureBtClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sureBt];
    }
    return self;
}
#pragma mark----实现类方法
+(instancetype)alterViewWithTitle:(NSString *)title
                          content:(NSString *)content
                           cancel:(NSString *)cancel
                             sure:(NSString *)sure
                    cancelBtClcik:(cancelBlock)cancelBlock
                      sureBtClcik:(sureBlock)sureBlock;
{
    MyAlertView *alterView=[[MyAlertView alloc]initWithFrame:CGRectMake(0, 0, 247, 163)];
    alterView.backgroundColor=[UIColor colorWithHexString:@"343D5E"];
//    alterView.alpha = 0.8;
    alterView.center=CGPointMake(ScreenWidth/2, ScreenHeight/2);
    alterView.layer.cornerRadius=8;
    alterView.layer.masksToBounds=YES;
    alterView.title=title;
    alterView.content=content;
    alterView.cancel=cancel;
    alterView.sure=sure;
    alterView.cancel_block=cancelBlock;
    alterView.sure_block=sureBlock;
    return alterView;
}

+(instancetype)alterViewWithbgImage:(NSString *)bgImage
                              Title:(NSString *)title
                            content:(NSString *)content
                             cancel:(NSString *)cancel
                               sure:(NSString *)sure
                      cancelBtClcik:(cancelBlock)cancelBlock
                        sureBtClcik:(sureBlock)sureBlock{
    MyAlertView *alterView=[[MyAlertView alloc]initWithFrame:CGRectMake(0, 0, 247, 163)];
    alterView.backgroundColor=[UIColor colorWithHexString:@"343D5E"];
    alterView.alpha = 0.8;
    alterView.center=CGPointMake(ScreenWidth/2, ScreenHeight/2);
    alterView.layer.cornerRadius=8;
    alterView.layer.masksToBounds=YES;
    alterView.title=title;
    alterView.content=content;
    alterView.cancel=cancel;
    alterView.sure=sure;
    alterView.cancel_block=cancelBlock;
    alterView.sure_block=sureBlock;
    return alterView;
}

#pragma mark--给属性重新赋值
-(void)setTitle:(NSString *)title
{
    _titleLb.text=title;
}
-(void)setContent:(NSString *)content
{
    _contentLb.text=content;
}
-(void)setSure:(NSString *)sure
{
    [_sureBt setTitle:sure forState:UIControlStateNormal];
}
-(void)setCancel:(NSString *)cancel
{
    [_cancelBt setTitle:cancel forState:UIControlStateNormal];
}
#pragma mark----取消按钮点击事件
-(void)cancelBtClick
{
    [self removeFromSuperview];
    if(self.cancel_block){
        self.cancel_block();
    }
}
#pragma mark----确定按钮点击事件
-(void)sureBtClick
{
    [self removeFromSuperview];
    if(self.sure_block){
        self.sure_block();
    }
}

+(instancetype)alertViewWithContent:(NSString *)contentStr{
    MyAlertView *alterView=[[MyAlertView alloc]initWithFrame:CGRectMake(0, 0, 250, 150)];
    alterView.backgroundColor=[UIColor whiteColor];
    alterView.center=CGPointMake(ScreenWidth/2, ScreenHeight/2);
    alterView.layer.cornerRadius=5;
    alterView.layer.masksToBounds=YES;
    alterView.content=contentStr;
    return alterView;
}



+ (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

@end
