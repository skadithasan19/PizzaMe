//
//  CustomCell.h
//  PizzaMe
//
//  Created by Md Adit Hasan on 4/4/16.
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lbltitle;
@property (weak, nonatomic) IBOutlet UILabel *lblAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblPhone;
@property (weak, nonatomic) IBOutlet UILabel *lblDistance;

@end
