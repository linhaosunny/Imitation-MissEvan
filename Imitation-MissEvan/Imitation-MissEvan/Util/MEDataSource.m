//
//  MEDataSource.m
//  Imitation-MissEvan
//
//  Created by huiren on 16/10/24.
//  Copyright © 2016年 xkl. All rights reserved.
//

#import "MEDataSource.h"

@implementation MEDataSource

+ (MEDataSource *)shareDataSource
{
    static MEDataSource * sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^(void) {
        sharedSingleton = [[self alloc] init];
        [sharedSingleton dataSourceOfTabBar];
        [sharedSingleton dataSourceOfSegment];
        [sharedSingleton dataSourceOfHomeRecommend];
        [sharedSingleton dataSourceOfVoiceList];
        [sharedSingleton dataSourceOfClassify];
    });
    return sharedSingleton;
}

- (void)dataSourceOfTabBar
{
    self.imageNameArray = [[NSArray alloc] initWithObjects:@"homepage", @"channel", @"", @"follow", @"mine", nil];
    self.barTitleArray = [[NSArray alloc] initWithObjects:@"首页", @"频道", @"", @"关注", @"我的", nil];
}

- (void)dataSourceOfSegment
{
    self.segmentTitleArray = [[NSArray alloc] initWithObjects:@"音单", @"推荐", @"分类", nil];
}

- (void)dataSourceOfHomeRecommend
{
    self.homeTopArray = @[@{@"image":@"hp3_icon_activity_40x40_", @"title":@"活动"},
                          @{@"image":@"hp3_icon_rank_41x40_", @"title":@"排行"},
                          @{@"image":@"hp3_icon_channel_41x40_", @"title":@"广播剧"},
                          @{@"image":@"hp3_icon_mission_40x40_", @"title":@"任务"}];
    
    
    self.bellDic = @{@"activity": @"hp3_title_bell2_40x40_",
                      @"rank": @"hp3_title_message2_40x40_",
                      @"channel": @"hp3_title_phone2_40x40_",
                      @"mission": @"hp3_title_sleep2_40x40_",
                      @"activity_title": @"闹铃",
                      @"rank_title": @"短信",
                      @"channel_title": @"来电",
                      @"mission_title": @"催眠"};
    
    self.akiraDic = @{@"activity": @"梶裕贵",
                      @"rank": @"小野大辅",
                      @"channel": @"花江夏树",
                      @"mission": @"钉宫理惠",
                      @"activity_title": @"梶裕贵",
                      @"rank_title": @"小野大辅",
                      @"channel_title": @"花江夏树",
                      @"mission_title": @"钉宫理惠"};
    
    self.topCellArray = @[@{@"image": @"hp3_icon_msound_small_26x26_",
                          @"title": @"人气M音"},
                        @{@"image": @"hp3_icon_channel_small_26x27_",
                          @"title": @"频道"},
                        @{@"image": @"hp3_icon_album_small_26x26_",
                          @"title": @"音单"},
                        @{@"image": @"hp3_icon_ring_small_26x26_",
                          @"title": @"铃声"},
                        @{@"image": @"hp3_icon_seiyu_small_26x26_",
                          @"title": @"推荐声优"},
                        @{@"image": @"hp3_icon_5_26x26_",
                          @"title": @"广播剧"}];

    
    self.recommendCellArray = @[@{@"themes_image": @"hotMVoice_topLeft",
                                  @"title": @"ACG周刊-25期-你的名字终于要播...",
                                  @"played_count": @"3841",
                                  @"words_count": @"37"},
                                @{@"themes_image": @"hotMVoice_topCenter",
                                  @"title": @"【3D环绕】Alan Walker - Faded",
                                  @"played_count": @"4879",
                                  @"words_count": @"38"},
                                @{@"themes_image": @"hotMVoice_topRight",
                                  @"title": @"游术评（使命召唤系列）《使命召唤》",
                                  @"played_count": @"3586",
                                  @"words_count": @"14"},
                                @{@"themes_image": @"hotMVoice_downLeft",
                                  @"title": @"【少年霜】世末歌者",
                                  @"played_count": @"3686",
                                  @"words_count": @"21"},
                                @{@"themes_image": @"hotMVoice_downCenter",
                                  @"title": @"【请爱我到时光尽头】“愿你了解...",
                                  @"played_count": @"3789",
                                  @"words_count": @"18"},
                                @{@"themes_image": @"hotMVoice_downRight",
                                  @"title": @"【3D】刀剑乱舞 花丸-心魂の在処",
                                  @"played_count": @"3924",
                                  @"words_count": @"13"}];

    self.channelCellArray = @[@{@"themes_image": @"日常精分现场",
                                @"title": @"日常精分现场",
                                @"played_count": @"1866"},
                              @{@"themes_image": @"剑网3",
                                @"title": @"剑网3",
                                @"played_count": @"2076"},
                              @{@"themes_image": @"震撼心灵的史诗音乐",
                                @"title": @"震撼心灵的史诗音乐",
                                @"played_count": @"325"},
                              @{@"themes_image": @"那些魔性的翻唱",
                                @"title": @"那些魔性的翻唱",
                                @"played_count": @"85"}];
    
    
    self.radioArray = @[@{@"themes_image": @"暴龙小猫咪",
                          @"title": @"现代耽美广播剧【我的暴龙小猫咪】全一期",
                          @"played_count": @"1010",
                          @"words_count": @"8"},
                        @{@"themes_image": @"足下的恋人",
                          @"title": @"【BD·SM慎入】《足下的恋人》第三期",
                          @"played_count": @"630",
                          @"words_count": @"2"},
                        @{@"themes_image": @"渣攻",
                          @"title": @"渣功重生手册第一期",
                          @"played_count": @"177",
                          @"words_count": @"0"}];
    
}

- (void)dataSourceOfVoiceList
{
    self.voiceListArray = @[@{@"themes_image": @"心灵的旋律",
                              @"title": @"【节奏纯音】心灵的旋律",
                              @"voice_count": @"34"},
                            @{@"themes_image": @"岁月如酒，江湖如歌",
                              @"title": @"【古风】岁月如酒，江湖如歌",
                              @"voice_count": @"19"},
                            @{@"themes_image": @"3D耳机音乐盛宴",
                              @"title": @"【3D大碟】3D耳机音乐盛宴 纵享狂欢",
                              @"voice_count": @"11"},
                            @{@"themes_image": @"将抖腿进行到底",
                              @"title": @"【3D】将抖腿进行到底",
                              @"voice_count": @"24"},
                            @{@"themes_image": @"小提琴&钢琴",
                              @"title": @"【珠帘合璧】小提琴&钢琴，这该是天然缠绵出美好的一对",
                              @"voice_count": @"9"},
                            @{@"themes_image": @"vocaliod+",
                              @"title": @"【高能（中毒）向】Vocaliod+电音remix",
                              @"voice_count": @"14"}];
    
    NSDictionary * titleDic1 = @{@"title": @"古风",
                                 @"image": @"new_line_soundlist_3x12_"};
    NSDictionary * titleDic2 = @{@"title": @"作业向",
                                 @"image": @"new_line_soundlist_3x12_"};
    NSDictionary * titleDic3 = @{@"title": @"治愈",
                                 @"image": @"new_line_soundlist_3x12_"};
    NSDictionary * titleDic4 = @{@"title": @"热血",
                                 @"image": @"new_line_soundlist_3x12_"};
    NSDictionary * titleDic5 = @{@"title": @"翻唱",
                                 @"image": @"new_line_soundlist_3x12_"};
    NSDictionary * titleDic6 = @{@"title": @"催眠",
                                 @"image": @"new_line_soundlist_3x12_"};
    
    self.voiceListTitle = [[NSArray alloc] initWithObjects:titleDic1, titleDic2, titleDic3, titleDic4, titleDic5, titleDic6, nil];
}

- (void)dataSourceOfClassify
{
    self.classiftPic = [[NSArray alloc] initWithObjects:@"http://static.missevan.com/app/46.png", @"http://static.missevan.com/app/8.png", @"http://static.missevan.com/app/26.png", @"http://static.missevan.com/app/54.png", @"http://static.missevan.com/app/5.png", @"http://static.missevan.com/app/41.png", @"http://static.missevan.com/app/6.png", @"http://static.missevan.com/app/4.png", @"http://static.missevan.com/app/13.png", @"http://static.missevan.com/app/52.png", @"http://static.missevan.com/app/55.png", @"http://static.missevan.com/app/65.png", nil];
    
    self.classiftTitle = [[NSArray alloc] initWithObjects:@"有声漫画", @"音乐", @"娱乐", @"催眠", @"广播剧", @"日抓", @"听书", @"电台", @"声优库", @"配音", @"游戏", @"铃声", nil];
}
@end
