//
//  PizzaListViewController.m
//  PizzaMe
//
//  Created by Md Adit Hasan on 4/4/16.
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import "PizzaListViewController.h"
#import "PizzaViewModel.h"
#import "GPSService.h"
#import "APICall.h"
@interface PizzaListViewController ()<GPSServiceDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) PizzaViewModel *pizzaModelVIew;
@end

@implementation PizzaListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(loadPizzaMe)];
    
    [self loadPizzaMe];
}


-(void)loadPizzaMe {

    GPSService *gps = [GPSService shareGPSService];
    gps.delegate = self;
    
}


#pragma mark - GPSServiceDelegate

-(void)didSendPlaceMark:(CLPlacemark *)placemark {

    [APICall loadNearByPizza:placemark.postalCode pizzas:^(NSArray *pizzas) {
        
        self.pizzaModelVIew = [[PizzaViewModel alloc] initWithTableView:self.tableView sourceSignal:pizzas];
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    detailViewController *detailView = [segue destinationViewController];
    [detailView setPizzaDetail:[[PizzaManager shareIServiceInstance] getPizzaBySelectedIndex:[[self.tableView indexPathForSelectedRow] row]]];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
