//
//  HTMLStringParser.h
//  NewsBeijing
//
//  Created by 邹明 on 13-11-30.
//  Copyright (c) 2013年 zoumingpro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTMLStringParser : NSObject

+ (id)sharedInstance;

- (NSString *)parseWithOriginalHTMLString:(NSString *)orginalHTML;

@end
