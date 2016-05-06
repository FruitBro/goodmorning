//
//  HTMLStringParser.m
//  NewsBeijing
//
//  Created by 邹明 on 13-11-30.
//  Copyright (c) 2013年 zoumingpro. All rights reserved.
//

#import "HTMLStringParser.h"

static HTMLStringParser *instance = nil;

@interface HTMLStringParser ()

- (NSString *)_getSubStringFromString:(NSString *)originalString WithstartTag:(NSString *)startString andEndedTag:(NSString *)endedString;

@end

@implementation HTMLStringParser

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[HTMLStringParser alloc] init];
    });
    return instance;
}


- (NSString *)parseWithOriginalHTMLString:(NSString *)orginalHTML
{
//    NSString *newString = [orginalHTML stringByReplacingOccurrencesOfString:@"../../.." withString:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication"];
//    
//    NSString *headerString = [self _getSubStringFromString:newString WithstartTag:@"<h1 class=\"\" align=\"center\">" andEndedTag:@"</h1>"];
//    NSString *bodyString = [self _getSubStringFromString:newString WithstartTag:@"<p>" andEndedTag:@"</p>"];
    NSString *localHTMLString = [NSString stringWithFormat:@"<html> \n"
                                 "<head> \n"
                                 "<style type=\"text/css\"> \n"
                                 "body {background-color: white;font-size:45px;}\n"
                                 "h3 {font-size: %f;font-style:plain;font-weight:bold;font-family: Arial, \"宋体\";background-color: rgb(255,255,255);padding:1px;}\n"
                                 "h3 {margin-top: 0.3cm;}\n"
                                 "</style> \n"
                                 "</head> \n"
                                 "<body>%@</body> \n"
                                 "</html>", 60.0f, orginalHTML];
    /*
    NSString *newString = [orginalHTML stringByReplacingOccurrencesOfString:@"../../.." withString:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication"];
    NSRange range = [newString rangeOfString:@"<!--MUSIC-->"];
    NSRange newRange = [newString rangeOfString:@"</body></html>"];
    NSString *str = [newString substringWithRange:NSMakeRange(range.location, newRange.location - range.location)];
    NSString *htmlString2 = [newString stringByReplacingOccurrencesOfString:str withString:@""];
    NSRange startRange = [htmlString2 rangeOfString:@"</style></head><body>"];
    NSRange endRange = [htmlString2 rangeOfString:@"</body>"];
    NSString *bodyString = [htmlString2 substringWithRange:NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length)];
    
    localHTMLString = [localHTMLString stringByReplacingOccurrencesOfString:@" <h2 class=\"\" align=\"center\">        <!--SUMMARY-->    </h2>" withString:@""];
    localHTMLString = [localHTMLString stringByReplacingOccurrencesOfString:@"<div id=\"article_body\" style=\"padding: 3px;\">" withString:@"<div id=\"article_body\" style=\"padding: 1px;\">"];
     */
    return localHTMLString;
}
- (NSString *)_getSubStringFromString:(NSString *)originalString WithstartTag:(NSString *)startString andEndedTag:(NSString *)endedString
{
    NSRange startedRange = [originalString rangeOfString:startString];
    NSRange endedRange = [originalString rangeOfString:endedString options:NSBackwardsSearch];
    NSRange newRange = NSMakeRange(startedRange.location, endedRange.location + endedRange.length - startedRange.location);
    NSString *subString = [originalString substringWithRange:newRange];
    subString = [subString stringByReplacingOccurrencesOfString:@"<p>&nbsp;</p>" withString:@""];
    subString = [subString stringByReplacingOccurrencesOfString:@"<p>&nbsp&nbsp&nbsp&nbsp<p>" withString:@""];
    return  subString;
}

@end
