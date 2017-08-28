//
//  LBService.m
//  NatureCard
//
//  Created by zhongzhi on 2017/8/9.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "LBService.h"
@implementation LBService
+(NSString*)getBaseUrlString
{
    return [NSString stringWithFormat:@"%@%@", SERVER_PROTOCOL, SERVER_URL] ;
}

+(NSString*)getParaString:(NSMutableDictionary*)paramDic
{
    NSString *outPutStr = @"";
    //拼接请求参数
    for (int i = 0; i < paramDic.allKeys.count;i++) {
        NSString *key = [paramDic.allKeys objectAtIndex:i];
        NSString *value = [paramDic valueForKey:key];
        if (i == 0) {
            outPutStr = [outPutStr stringByAppendingFormat:@"%@=%@",key,value];
        }else{
            outPutStr = [outPutStr stringByAppendingFormat:@"&%@=%@",key,value];
        }
    }
    return outPutStr;
}

+(NSString*)getURLString:(NSString*)api param:(NSMutableDictionary*)paramDic
{
    NSString *url= @"";
    if (paramDic) {
         url = [NSString stringWithFormat:@"%@%@?%@",[self getBaseUrlString],api,[self getParaString:paramDic]] ;
    }else{
        url = [NSString stringWithFormat:@"%@%@",[self getBaseUrlString],api] ;
    }
   
    
    return  [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}


#pragma mark--登陆注册模块
+(NSString *)regisetCountMan:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/registCounterman" param:paramDic];
}

/** 注册时完善个人资料*/
+(NSString *)perfectCountermanInformation:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/perfectCountermanInformation" param:paramDic];
}

/** 加载所有所属公司*/
+(NSString *)loadAllCompanyListList:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/loadAllCompanyListList" param:paramDic];

}

/** 加载一级销售区域*/
+(NSString *)loadAllOneLevelSaleArea:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"loadAllOneLevelSaleArea" param:paramDic];

}

/** 根据一级区域加载二级区域*/
+(NSString *)loadOneLevelSaleAreaToTwo:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"loadOneLevelSaleAreaToTwo" param:paramDic];

}

/** 根据二级区域加载三级区域*/
+(NSString *)loadTwoLevelSaleAreaToThree:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"loadTwoLevelSaleAreaToThree" param:paramDic];

}
/** 加载所有区域*/
+(NSString *)LoadAllSaleArea:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"LoadAllSaleArea" param:paramDic];
}
/**登录*/
+(NSString *)loginCounterman:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/loginCounterman" param:paramDic];
    
}

/** 忘记密码创建新密码*/
+(NSString *)retrievePassword:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/retrievePassword" param:paramDic];

}

/** 发送邮箱验证码*/
+(NSString *)sendmail:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"sendmail" param:paramDic];

}

/** 发送手机验证码*/
+(NSString *)sendmessage:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"sendmessage" param:paramDic];

}


#pragma mark ---商城模块--
/** 售卡商城初始页*/
+(NSString *)appCountermanBanner:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/AppCountermanBanner" param:paramDic];

}


/** 提交订单*/
+(NSString *)addGobuyaCardOrderList:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/addGobuyaCardOrderList" param:paramDic];

    
}



/** 添加业务员收货地址*/
+(NSString *)addCountermanReceiveAddress:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/addCountermanReceiveAddress" param:paramDic];

}

/** 查询业务员所有地址*/
+(NSString *)loadCountermanAllReceive:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/loadCountermanAllReceive" param:paramDic];

}

/** 查询业务员默认地址*/
+(NSString *)loadDefaultReceive:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/loadDefaultReceive" param:paramDic];

}


/** 根据id加载地址信息*/
+(NSString *)loadDetailCountermanById:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/loadDetailCountermanById" param:paramDic];

}

/** 更改收货地址*/
+(NSString *)updateCountermanReceiveAddress:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/updateCountermanReceiveAddress" param:paramDic];

}



#pragma mark----个人中心---
#pragma mark----设置--
/** 意见建议*/
+(NSString *)addCountermanOpinion:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/AddCountermanOpinion" param:paramDic];

}
#pragma mark----我的订单--
+(NSString *)loadCountermanAllOrderList:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/loadCountermanAllOrderList" param:paramDic];

}

/** 根据订单id删除订单*/
+(NSString *)deleteCountermanOrderList:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/deleteCountermanOrderList" param:paramDic];
}

/** 订单确认收货*/
+(NSString *)confirmGoodsOrderList:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/confirmGoodsOrderList" param:paramDic];

}

#pragma mark --密码安全---

+(NSString *)setCountermanSignPassword:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/setCountermanSignPassword" param:paramDic];
}
/** 修改密码*/
+(NSString *)updateCountermanPassword:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/updateCountermanPassword" param:paramDic];
}


#pragma mark --销售管理---
/** 加载当前用户的一二三及团队人数*/
+(NSString *)loadCountermanTdNumber:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/loadCountermanTdNumber" param:paramDic];
}

/** 会员卡概览*/
+(NSString *)loadAddCardNumber:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/loadAddCardNumber" param:paramDic];
}

/** 一级团队主界面*/
+(NSString *)loadOneCounterman:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/loadOneCounterman" param:paramDic];
}

/** 一级团队详情*/
+(NSString *)loadOneTeamDetails:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/loadOneTeamDetails" param:paramDic];
}

/** 一级团队个人信息及添加卡数*/
+(NSString *)loadPersonageCard:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/loadPersonageCard" param:paramDic];
}

/** 二级团队主界面*/
+(NSString *)loadTwoCounterman:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/loadTwoCounterman" param:paramDic];
}

/** 三级团队主界面*/
+(NSString *)loadThreeCounterman:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/loadThreeCounterman" param:paramDic];
}



/** 发送个人消息*/
+(NSString *)sendPerNotices:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/sendPerNotices" param:paramDic];
}
/** 发送团队消息*/
+(NSString *)sendTeamNotices:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/sendTeamNotices" param:paramDic];
}

/** 发送消息列表*/
+(NSString *)sellNoticesList:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/sellNoticesList" param:paramDic];
}
/** 接收消息列表*/
+(NSString *)JieShouNoticesList:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/JieShouNoticesList" param:paramDic];
}

#pragma mark --会员卡管理---
/** 会员卡列表*/
+(NSString *)loadCountermanCard:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/LoadCountermanCard" param:paramDic];

}

/** 会员卡充值*/
+(NSString *)topCard:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/topCard" param:paramDic];

}

/** 会员卡高级查询*/
+(NSString *)loadGjCardNumber:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/LoadGjCardNumber" param:paramDic];

}

/** 会员卡号模糊查询*/
+(NSString *)loadCardNumber:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/LoadCardNumber" param:paramDic];

}

/** 根据id加载会员卡信息*/
+(NSString *)loadCardById:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/loadCardById" param:paramDic];

}




/** 删除会员卡*/
+(NSString *)deleteCardServlet:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/deleteCardServlet" param:paramDic];

}

/** 业务员添加会员卡*/
+(NSString *)addCountermanCard:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/addCountermanCard" param:paramDic];

}

#pragma mark --首页---
/** 首页统计*/
+(NSString *)sumzhuanMoney:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/sumzhuanMoney" param:paramDic];
    
}

/** 标记为已读消息*/
+(NSString *)updateNotices:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/updateNotices" param:paramDic];
    
}


/** 删除消息*/
+(NSString *)DeleteNotices:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/DeleteNotices" param:paramDic];
    
}


/** 消息详情*/
+(NSString *)IdFindNotices:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/IdFindNotices" param:paramDic];
    
}


/** 消息列表*/
+(NSString *)Notices:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/Notices" param:paramDic];
    
}



/** 排行榜*/
+(NSString *)NatonCharts:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/NatonCharts" param:paramDic];
    
}

/** 地区排行榜*/
+(NSString *)levelAreaCharts:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/levelAreaCharts" param:paramDic];

}
#pragma mark --个人中心---
/** 修改手机*/
+(NSString *)updateCountermanPhoneOrEmail:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/updateCountermanPhoneOrEmail" param:paramDic];
    
}
/**更改头像*/
+(NSString *)pdateCountermanHeadImage:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/pdateCountermanHeadImage" param:paramDic];
    
}


/** 更改姓名*/
+(NSString *)updateCountermanName:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/updateCountermanName" param:paramDic];
    
}


/** 更改身份证号*/
+(NSString *)updateCountermanIdCardNumber:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/updateCountermanIdCardNumber" param:paramDic];
    
}


/** 更改所属公司*/
+(NSString *)updateCountermanCompany:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/updateCountermanCompany" param:paramDic];
    
}


/** 更改销售区域*/
+(NSString *)updateCountermanAddress:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/updateCountermanAddress" param:paramDic];
    
}
/** 查询当前帐号的所有信息*/
+(NSString *)loadCountermanData:(NSMutableDictionary *)paramDic{
    return [self getURLString:@"appcard/loadCountermanData" param:paramDic];

}
@end
