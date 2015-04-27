//
//  EUExTestinCrash.m
//  AppCanPlugin
//
//  Created by AppCan on 15/4/22.
//  Copyright (c) 2015年 zywx. All rights reserved.
//

#import "EUExTestinCrash.h"
#import "EUExBase.h"
#import <TestinAgent/TestinAgent.h>

@interface EUExTestinCrash()

@end



@implementation EUExTestinCrash





-(id)initWithBrwView:(EBrowserView *)eInBrwView{
    self=[super initWithBrwView:eInBrwView];
    if(self){
      
    }
    return  self;
}

-(void)clean{
   
}

-(void)dealloc{
    [self clean];
    [super dealloc];
}

/*
###1.init(param)//初始化

var param{
    appKey;//应用的AppKey
    channel;//应用的渠道号
}

注：如果在项目中还引用了友盟、Takingdata 等同类产品，需要将它们的错误分析收集的功能取消。
*/


-(void)init:(NSMutableArray *)array{
    id info =[self getDataFromJson:array[0]];
    [TestinAgent init:[info objectForKey:@"appKey"] channel:[info objectForKey:@"channel"]];
    NSLog(@"init");
}

/*
 ###2.setUserInfo(param)//设置用户名
 var param{
 username;//用户名
 }
 
 注：如不设置，平台将默认显示为“匿名用户”。
 */
-(void)setUserInfo:(NSMutableArray *)array{
    id info =[self getDataFromJson:array[0]];
    [TestinAgent setUserInfo:[info objectForKey:@"username"]];
    NSLog(@"setUserInfo");
}

/*
 ###3.leaveBreadcrumb(param)//上传面包屑
 var param{
 breadcrumb;//面包屑字符串
 }
 */
-(void)leaveBreadcrumb:(NSMutableArray *)array{
    id info =[self getDataFromJson:array[0]];
    [TestinAgent leaveBreadcrumbWithString:[info objectForKey:@"breadcrumb"]];
    NSLog(@"leaveBreadcrumb");
}

-(void)test:(NSMutableArray *)array{

    NSArray *test=[[NSArray alloc] initWithObjects:@"1",@"2", nil];
    for(int i=0;i<4;i++) NSLog(test[i]);
   
}



//从json字符串中获取数据
- (id)getDataFromJson:(NSString *)jsonData{
    NSError *error = nil;
    
    
    
    NSData *jsonData2= [jsonData dataUsingEncoding:NSUTF8StringEncoding];
    
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData2
                     
                                                    options:NSJSONReadingMutableContainers
                     
                                                      error:&error];
    
    if (jsonObject != nil && error == nil){
        
        return jsonObject;
    }else{
        
        // 解析錯誤
        
        return nil;
    }
    
}


@end