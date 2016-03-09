//
//  Header.h
//  joker
//
//  Created by scjy on 16/3/4.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger ,ClassfyType){
    ClassfyTypeRecommend = 1,
    ClassfyTypeViedo,
    ClassfyTypePicture,
    ClassfyTypeJoke,
    ClassfyTypeBest,
    ClassfyTypeSameCity
};

//推荐接口
#define kRecommend @"http://ic.snssdk.com/neihan/stream/mix/v1/?content_type=-101"
//视频接口
#define kVideo @"http://ic.snssdk.com/neihan/stream/mix/v1/?content_type=-104"
//图片接口
#define kPicture @"http://ic.snssdk.com/neihan/stream/mix/v1/?content_type=-103"
//段子接口
#define kJoke @"http://ic.snssdk.com/neihan/stream/mix/v1/?content_type=-102"
//精华接口
#define kBest @"http://i.snssdk.com/neihan/in_app/essence_list/"
//同城接口
#define kSameCity @"http://ic.snssdk.com/neihan/stream/mix/v1/?content_type=-201"

//  发现 @"http://lf.snssdk.com/2/essay/discovery/v3/?iid=3773916990&device_id=11828359714&ac=wifi&channel=tengxun&aid=7&app_name=joke_essay&version_code=500&version_name=5.0.0&device_platform=android&ssmix=a&device_type=HONOR+H30-L01M&os_api=19&os_version=4.4.2&uuid=865666020837771&openudid=aac18c62be745c13&manifest_version_code=500"
//   是个应用 @"http://lf.snssdk.com/service/3/app_components/?screen_type=android_hdpi&iid=3773916990&device_id=11828359714&ac=wifi&channel=tengxun&aid=7&app_name=joke_essay&version_code=500&version_name=5.0.0&device_platform=android&ssmix=a&device_type=HONOR+H30-L01M&os_api=19&os_version=4.4.2&uuid=865666020837771&openudid=aac18c62be745c13&manifest_version_code=500"
//评论接口
#define kcomment @"http://isub.snssdk.com/neihan/comments/?group_id=%@&item_id=%@&count=20&offset=0&iid=3773916990&device_id=11828359714&ac=wifi&channel=tengxun&aid=7&app_name=joke_essay&version_code=500&version_name=5.0.0&device_platform=android&ssmix=a&device_type=HONOR+H30-L01M&os_api=19&os_version=4.4.2&uuid=865666020837771&openudid=aac18c62be745c13&manifest_version_code=500"

#endif /* Header_h */
