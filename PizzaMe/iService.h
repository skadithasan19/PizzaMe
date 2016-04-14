//
//  iService.h
//  PizzaMe
//
//  Created by Md Adit Hasan on 4/4/16.
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface iService : NSObject

 + (void)getJsonResponse : (NSString *)urlStr success : (void (^)(NSDictionary *responseDict))success failure:(void(^)(NSError* error))failure;

 + (void) callToMobileNumber:(NSString *)number completionHandler:(void (^)(BOOL success))completion controller:(UIViewController *) controller;

@end
