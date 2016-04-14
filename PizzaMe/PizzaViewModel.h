//
//  ViewController.h
//  PizzaMe
//
//  Created by Md Adit Hasan on 4/4/16.
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PizzaViewProtocolDelegate <NSObject>

-(void)didPizzaSelectIndex:(NSIndexPath *)indexpath;

@end

@interface PizzaViewModel : NSObject

- (instancetype)initWithTableView:(UITableView *)tableView
                     sourceSignal:(NSArray *)source;

+ (instancetype)HelperForTableView:(UITableView *)tableView
                      sourceSignal:(NSArray *)source;

@property (weak, nonatomic)id <PizzaViewProtocolDelegate> delegate;

@end

