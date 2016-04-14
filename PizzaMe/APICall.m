//
//  APICall.m
//  PizzaMe
//
//  Created by Md Adit Hasan on 4/4/16.
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import "APICall.h"

#define BaseAPI @"https://query.yahooapis.com/v1/public/"

#define FoodType @"pizza"

@implementation APICall



+ (void)loadNearByPizza:(NSString *)postCode pizzas: (void (^)(NSArray *responseDict))response{
    if (!postCode) {
        response(nil);
    }
    NSString *api = [NSString stringWithFormat:@"%@yql?q=select * from local.search where zip='%@' and query='%@'&format=json&diagnostics=true&callback=",BaseAPI,postCode,FoodType];
    
    NSString *encodedString =[api stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
    
    [iService getJsonResponse:encodedString success:^(NSDictionary *responseDict) {
        // success block
        response([responseDict valueForKeyPath:@"query.results.Result"]);
    
    } failure:^(NSError *error) {
        // This is failure block
        
    }];
    
}

@end
