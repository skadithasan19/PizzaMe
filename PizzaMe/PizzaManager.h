//
//  PizzaManager.h
//  PizzaMe
//
//  Created by Md Adit Hasan on 4/4/16.
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"
@interface PizzaManager : NSObject

@property (nonatomic, strong) NSMutableArray *pizzaList;

-(void)addPizzas:(NSArray *)list completionHandler:(void (^)(NSArray *list))completion;

+ (PizzaManager *) shareIServiceInstance;

-(NSInteger) getPizzaCount;

// @return pizza by selected index
-(Pizza *)getPizzaBySelectedIndex:(NSInteger)indexpath;
@end
