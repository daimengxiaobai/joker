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


#endif /* Header_h */
