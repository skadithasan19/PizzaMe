//
//  Pizza.m
//  PizzaMe
//
//  Created by Md Adit Hasan on 4/4/16.
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import "Pizza.h"

@implementation Pizza

+ (iService *)shareIServiceInstance {
    
    static iService *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance =[[iService alloc] init];
    });
    
    return shareInstance;
}

@end
