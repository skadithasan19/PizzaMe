//
//  ViewController.m
//  PizzaMe
//
//  Created by Md Adit Hasan on 4/4/16.
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import "PizzaViewModel.h"
#import "CustomCell.h"


@interface PizzaViewModel ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}

@end

static NSString *cellIdentifier = @"cell";

@implementation PizzaViewModel


- (instancetype)initWithTableView:(UITableView *)tableView
                     sourceSignal:(NSArray *)source {
    
    if (self = [super init]) {
        _tableView = tableView;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [[PizzaManager shareIServiceInstance] addPizzas:source completionHandler:^(NSArray *list) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [_tableView reloadData];
            });
            
        }];
    }
    return self;
}

+ (instancetype)HelperForTableView:(UITableView *)tableView
                             sourceSignal:(NSArray *)source {
    
    return [[PizzaViewModel alloc] initWithTableView:tableView
                                                  sourceSignal:source];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = [[PizzaManager shareIServiceInstance] getPizzaCount];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
        CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        Pizza *data = [[PizzaManager shareIServiceInstance] getPizzaBySelectedIndex:indexPath.row];
        cell.lbltitle.text = data.title;
        cell.lblPhone.text = data.phone;
        cell.lblAddress.text = [NSString stringWithFormat:@"%@,%@",data.city,data.state];
        cell.lblDistance.text = [NSString stringWithFormat:@"%@mi",data.distance]; // I am just assuming it as mile
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    

    if ([self.delegate respondsToSelector:@selector(didPizzaSelectIndex:)]) {
        [self.delegate didPizzaSelectIndex:indexPath];
    }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}






@end
