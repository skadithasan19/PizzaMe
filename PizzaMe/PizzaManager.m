//
//  PizzaManager.m
//  PizzaMe
//
//  Created by Md Adit Hasan on 4/4/16.
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import "PizzaManager.h"
#import "Pizza.h"



@implementation PizzaManager

+ (PizzaManager *)shareIServiceInstance {
    
    static PizzaManager *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance =[[PizzaManager alloc] init];
    });
    
    return shareInstance;
}

// create pizzas list
-(void)addPizzas:(NSArray *)list completionHandler:(void (^)(NSArray *list))completion{
    
    self.pizzaList = [[NSMutableArray alloc] initWithCapacity:[list count]];
    
   [list enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Pizza *pizza = [Pizza new];
       [pizza setTitle:[obj valueForKey:@"Title"]];
       [pizza setPhone:[obj valueForKey:@"Phone"]];
       [pizza setCity:[obj valueForKey:@"City"]];
       [pizza setState:[obj valueForKey:@"State"]];
       [pizza setDistance:[obj valueForKey:@"Distance"]];
       [pizza setLathitude:[obj valueForKey:@"Latitude"]];
       [pizza setLongitude:[obj valueForKey:@"Longitude"]];
       [self.pizzaList addObject:pizza];
   }];
    completion(list);
    
}

//@return total number of pizza
-(NSInteger) getPizzaCount {
    return [self.pizzaList count];
}

// @return pizza by selected index
-(Pizza *)getPizzaBySelectedIndex:(NSInteger)indexpath {
    return [self.pizzaList objectAtIndex:indexpath];
}


@end
