//
//  FPicker.m
//  Pods
//
//  Created by 郑江荣 on 2017/7/18.
//
//

#import "FPicker.h"
#import "farwolf.h"
@implementation FPicker

- (IBAction)cancelClick:(id)sender {
    
  
    [self dismiss];
}

- (IBAction)doneClick:(id)sender {
    [self dismiss];
      _done(@{@"index1":@(_index1),@"index2":@(_index2),@"index3":@(_index3)},true);
}

-(void)dismiss
{
    [self gone];
//    [self setHidden:true];
    
}

-(void)setTheme:(NSString*)bgcolor btncolor:(NSString*)btncolor
{
    [self.toolbar setBarTintColor:[bgcolor toColor]];
    [self.toolbar setTintColor:[btncolor toColor]];
}

-(void)show
{
 
 
      [self setHidden:false];
}


-(void)setCount:(int)count
{
     _count=count;
     _index1=-1;
     _index2=-1;
     _index3=-1;
    self.picker.delegate=self;
    self.picker.dataSource=self;
}

-(void)setItems1:(NSArray*)l
{
    self.data1=l;
    _index1=0;
    [_picker reloadComponent:0];
}

-(void)setItems2:(NSArray*)l
{
    self.data2=l;
     _index2=0;
    [_picker reloadComponent:1];
}


-(void)setItems3:(NSArray*)l
{
    self.data3=l;
     _index3=0;
    [_picker reloadComponent:2];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
   if(component==0)
   {
       _index1=row;
       _change1(@{@"index":@(row)},true);
//       _change1(row,true);
       
   }
    if(component==1)
    {
         _index2=row;
        _change2(@{@"index":@(row)},true);
    }
    
    if(component==2)
    {
         _index3=row;
        _change3(@{@"index":@(row)},true);
    }
    
}
-(void)selectRow:(int)p row:(int)row
{
    [_picker selectRow:row inComponent:p animated:false];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
 
    return _count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component==0)
    {
        return _data1.count;
    }
    if(component==1)
    {
        return _data2.count;
    }
    if(component==2)
    {
        return _data3.count;
    }
    
    return 0;
}

-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if(component==0)
    {
        return _data1[row];
    }
    if(component==1)
    {
        return _data2[row];
    }
    if(component==2)
    {
        return _data3[row];
    }
    return   @"";
}


- (void)com {
    
    CGRect c=self.frame;
    [UIView animateWithDuration:0.15 animations:^{
        // 设置view弹出来的位置
        self.frame = CGRectMake(0, self.vc.screenHeight-c.size.height, self.vc.screenWidth, c.size.height);
    }];
    
    
    
}


- (void)gone {
    
      CGRect c=self.frame;
    [UIView animateWithDuration:0.15 animations:^{
       
       self.frame = CGRectMake(0, self.vc.screenHeight, self.vc.screenWidth, c.size.height);
    }];
    
    
    
}


@end
