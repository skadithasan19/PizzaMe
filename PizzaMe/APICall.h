//
//  APICall.h
//  PizzaMe
//
//  Created by Md Adit Hasan on 4/4/16.
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APICall : NSObject

+ (void)loadNearByPizza:(NSString *)postCode pizzas: (void (^)(NSArray *responseDict))response;

@end
