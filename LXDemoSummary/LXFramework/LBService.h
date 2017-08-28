//
//  LBService.h
//  NatureCard
//
//  Created by zhongzhi on 2017/8/9.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBService : NSObject
#pragma mark ---登陆模块--
/** 业务员注册*/
+(NSString *)regisetCountMan:(NSMutableDictionary *)paramDic;

/** 注册时完善个人资料*/
+(NSString *)perfectCountermanInformation:(NSMutableDictionary *)paramDic;

/** 加载所有所属公司*/
+(NSString *)loadAllCompanyListList:(NSMutableDictionary *)paramDic;

/** 加载一级销售区域*/
+(NSString *)loadAllOneLevelSaleArea:(NSMutableDictionary *)paramDic;

/** 根据一级区域加载二级区域*/
+(NSString *)loadOneLevelSaleAreaToTwo:(NSMutableDictionary *)paramDic;

/** 根据二级区域加载三级区域*/
+(NSString *)loadTwoLevelSaleAreaToThree:(NSMutableDictionary *)paramDic;

/** 加载所有区域*/
+(NSString *)LoadAllSaleArea:(NSMutableDictionary *)paramDic;

/**登录*/
+(NSString *)loginCounterman:(NSMutableDictionary *)paramDic;

/** 忘记密码创建新密码*/
+(NSString *)retrievePassword:(NSMutableDictionary *)paramDic;

/** 发送邮箱验证码*/
+(NSString *)sendmail:(NSMutableDictionary *)paramDic;

/** 发送手机验证码*/
+(NSString *)sendmessage:(NSMutableDictionary *)paramDic;


#pragma mark ---商城模块--
/** 售卡商城初始页*/
+(NSString *)appCountermanBanner:(NSMutableDictionary *)paramDic;

/** 提交订单*/
+(NSString *)addGobuyaCardOrderList:(NSMutableDictionary *)paramDic;



/** 添加业务员收货地址*/
+(NSString *)addCountermanReceiveAddress:(NSMutableDictionary *)paramDic;

/** 查询业务员所有地址*/
+(NSString *)loadCountermanAllReceive:(NSMutableDictionary *)paramDic;

/** 查询业务员默认地址*/
+(NSString *)loadDefaultReceive:(NSMutableDictionary *)paramDic;


/** 根据id加载地址信息*/
+(NSString *)loadDetailCountermanById:(NSMutableDictionary *)paramDic;

/** 更改收货地址*/
+(NSString *)updateCountermanReceiveAddress:(NSMutableDictionary *)paramDic;



#pragma mark----个人中心---
#pragma mark----设置--
/** 意见建议*/
+(NSString *)addCountermanOpinion:(NSMutableDictionary *)paramDic;


#pragma mark----我的订单--
/** 订单列表*/
+(NSString *)loadCountermanAllOrderList:(NSMutableDictionary *)paramDic;

/** 根据订单id删除订单*/
+(NSString *)deleteCountermanOrderList:(NSMutableDictionary *)paramDic;

/** 订单确认收货*/
+(NSString *)confirmGoodsOrderList:(NSMutableDictionary *)paramDic;

#pragma mark --密码安全---
/** 创建手势密码*/
+(NSString *)setCountermanSignPassword:(NSMutableDictionary *)paramDic;
/** 修改密码*/
+(NSString *)updateCountermanPassword:(NSMutableDictionary *)paramDic;

#pragma mark --销售管理---
/** 加载当前用户的一二三及团队人数*/
+(NSString *)loadCountermanTdNumber:(NSMutableDictionary *)paramDic;



/** 一级团队主界面*/
+(NSString *)loadOneCounterman:(NSMutableDictionary *)paramDic;

/** 一级团队详情*/
+(NSString *)loadOneTeamDetails:(NSMutableDictionary *)paramDic;

/** 一级团队个人信息及添加卡数*/
+(NSString *)loadPersonageCard:(NSMutableDictionary *)paramDic;

/** 二级团队主界面*/
+(NSString *)loadTwoCounterman:(NSMutableDictionary *)paramDic;

/** 三级团队主界面*/
+(NSString *)loadThreeCounterman:(NSMutableDictionary *)paramDic;



/** 发送个人消息*/
+(NSString *)sendPerNotices:(NSMutableDictionary *)paramDic;

/** 发送团队消息*/
+(NSString *)sendTeamNotices:(NSMutableDictionary *)paramDic;

/** 发送消息列表*/
+(NSString *)sellNoticesList:(NSMutableDictionary *)paramDic;
/** 接收消息列表*/
+(NSString *)JieShouNoticesList:(NSMutableDictionary *)paramDic;



#pragma mark --会员卡管理---
/** 会员卡列表*/
+(NSString *)loadCountermanCard:(NSMutableDictionary *)paramDic;

/** 会员卡充值*/
+(NSString *)topCard:(NSMutableDictionary *)paramDic;

/** 会员卡高级查询*/
+(NSString *)loadGjCardNumber:(NSMutableDictionary *)paramDic;

/** 会员卡号模糊查询*/
+(NSString *)loadCardNumber:(NSMutableDictionary *)paramDic;

/** 根据id加载会员卡信息*/
+(NSString *)loadCardById:(NSMutableDictionary *)paramDic;


/** 会员卡概览*/
+(NSString *)loadAddCardNumber:(NSMutableDictionary *)paramDic;

/** 删除会员卡*/
+(NSString *)deleteCardServlet:(NSMutableDictionary *)paramDic;

/** 业务员添加会员卡*/
+(NSString *)addCountermanCard:(NSMutableDictionary *)paramDic;

#pragma mark --首页---
/** 首页统计*/
+(NSString *)sumzhuanMoney:(NSMutableDictionary *)paramDic;

/** 标记为已读消息*/
+(NSString *)updateNotices:(NSMutableDictionary *)paramDic;

/** 删除消息*/
+(NSString *)DeleteNotices:(NSMutableDictionary *)paramDic;

/** 消息详情*/
+(NSString *)IdFindNotices:(NSMutableDictionary *)paramDic;

/** 消息列表*/
+(NSString *)Notices:(NSMutableDictionary *)paramDic;


/** 全国排行榜*/
+(NSString *)NatonCharts:(NSMutableDictionary *)paramDic;

/** 地区排行榜*/
+(NSString *)levelAreaCharts:(NSMutableDictionary *)paramDic;

#pragma mark --个人中心---
/** 修改手机*/
+(NSString *)updateCountermanPhoneOrEmail:(NSMutableDictionary *)paramDic;

/**更改头像*/
+(NSString *)pdateCountermanHeadImage:(NSMutableDictionary *)paramDic;

/** 更改姓名*/
+(NSString *)updateCountermanName:(NSMutableDictionary *)paramDic;

/** 更改身份证号*/
+(NSString *)updateCountermanIdCardNumber:(NSMutableDictionary *)paramDic;

/** 更改所属公司*/
+(NSString *)updateCountermanCompany:(NSMutableDictionary *)paramDic;

/** 更改销售区域*/
+(NSString *)updateCountermanAddress:(NSMutableDictionary *)paramDic;

/** 查询当前帐号的所有信息*/
+(NSString *)loadCountermanData:(NSMutableDictionary *)paramDic;
@end
