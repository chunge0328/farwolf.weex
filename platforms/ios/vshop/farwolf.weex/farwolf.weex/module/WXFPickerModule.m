//
//  WXFPickerModule.m
//  Pods
//
//  Created by 郑江荣 on 2017/7/18.
//
//

#import "WXFPickerModule.h"
#import "farwolf.h"
@implementation WXFPickerModule
@synthesize weexInstance;
WX_EXPORT_METHOD(@selector(show))
WX_EXPORT_METHOD(@selector(dismiss))
WX_EXPORT_METHOD(@selector(setItems1:))
WX_EXPORT_METHOD(@selector(setItems2:))
WX_EXPORT_METHOD(@selector(setItems3:))
WX_EXPORT_METHOD(@selector(setChange:change2:change3:))
WX_EXPORT_METHOD(@selector(setDone:))
WX_EXPORT_METHOD(@selector(setCount:))
WX_EXPORT_METHOD(@selector(select:row:))
WX_EXPORT_METHOD(@selector(setTheme:btncolor:))


-(void)show
{
    [self initPicker];
    [self com];
    [_p show];
    
}

-(void)dismiss
{
    [self initPicker];

       [self gone];
//        [_p dismiss];
}

-(void)initPicker
{
    if(_p==nil)
    {
        UIWindow *w= [UIApplication sharedApplication].keyWindow;
        NSArray *n=  [[NSBundle mainBundle]loadNibNamed:@"Picker" owner:self options:nil];
        _p=  (UIView*)n[0];
        _p.frame=CGRectMake(0, weexInstance.viewController.screenHeight, weexInstance.viewController.screenWidth, 300.0);
        _p.vc=weexInstance.viewController;
        [w addSubview:_p];
        [_p setHidden:false];
    }
}

-(void)select:(int)p row:(int)row
{
    p--;
    [_p  selectRow:p row:row];
}
-(void)setCount:(int)count
{
    [self initPicker];
    [_p setCount:count];
}

-(void)setItems1:(NSArray*)l
{
    [self initPicker];
    [_p setItems1:l];
}

-(void)setItems2:(NSArray*)l
{
    [self initPicker];
    [_p setItems2:l];
}

-(void)setItems3:(NSArray*)l
{
    [self initPicker];
    [_p setItems3:l];
}

-(void)setTheme:(NSString*)bgcolor btncolor:(NSString*)btncolor
{
      [self initPicker];
    [_p setTheme:bgcolor btncolor:btncolor];
}

-(void)setChange:(WXModuleKeepAliveCallback)change1 change2:(WXModuleKeepAliveCallback)change2 change3:(WXModuleKeepAliveCallback)change3
{
    [self initPicker];
    _p.change1=change1;
    _p.change2=change2;
    _p.change3=change3;
}

-(void)setDone:(WXModuleKeepAliveCallback)done
{
    [self initPicker];
    _p.done=done;
    
}

- (void)dealloc
{
    [_p removeFromSuperview];
}


- (void)com {
 
    [UIView animateWithDuration:0.15 animations:^{
        // 设置view弹出来的位置
        _p.frame = CGRectMake(0, weexInstance.viewController.screenHeight-300, weexInstance.viewController.screenWidth, 300);
    }];
    
  
   
}


- (void)gone {
    
    [UIView animateWithDuration:1 animations:^{
        // 设置view弹出来的位置
        _p.frame = CGRectMake(0, weexInstance.viewController.screenHeight, weexInstance.viewController.screenWidth, 300);
    }];
    
    
    
}

@end
