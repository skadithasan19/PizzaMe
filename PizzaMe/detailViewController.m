//
//  detailViewController.m
//  PizzaMe
//
//  Created by Md Adit Hasan on 4/4/16.
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import "detailViewController.h"

@interface detailViewController ()

@end

@implementation detailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.txtTitle.text = self.pizzaDetail.title;
    self.txtAddress.text = [NSString stringWithFormat:@"%@,%@",self.pizzaDetail.city,self.pizzaDetail.state];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)callNow:(id)sender {
    
    [iService callToMobileNumber:self.pizzaDetail.phone completionHandler:^(BOOL success) {
        
        
    } controller:self];
}

- (IBAction)directionNow:(id)sender {
    
    if ([[UIApplication sharedApplication] canOpenURL:
         [NSURL URLWithString:@"comgooglemaps://"]]) {
        [[UIApplication sharedApplication] openURL:
         [NSURL URLWithString:[NSString stringWithFormat:@"comgooglemaps://?q=Pizza&center=%@,%@&zoom=14&views=traffic",self.pizzaDetail.lathitude,self.pizzaDetail.longitude]]];
    } else {
        NSLog(@"Can't use comgooglemaps://");
    }
    
}
@end
