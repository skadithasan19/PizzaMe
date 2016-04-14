//
//  detailViewController.h
//  PizzaMe
//
//  Created by Md Adit Hasan on 4/4/16.
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailViewController : UIViewController

@property (nonatomic, strong) Pizza *pizzaDetail;

@property (weak, nonatomic) IBOutlet UILabel *txtTitle;

@property (weak, nonatomic) IBOutlet UILabel *txtAddress;

- (IBAction)callNow:(id)sender;

- (IBAction)directionNow:(id)sender;

@end
