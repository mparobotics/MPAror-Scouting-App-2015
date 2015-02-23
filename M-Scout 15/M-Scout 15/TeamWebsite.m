//
//  TeamWebsite.m
//  M-Scout 15
//
//  Created by Brendan Boyle on 2/23/15.
//  Copyright (c) 2015 FRC: Team 3926. All rights reserved.
//

#import "TeamWebsite.h"
#import "SVWebViewController.h"

@interface TeamWebsite ()

@end

@implementation TeamWebsite

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SVWebViewController *webViewController = [[SVWebViewController alloc] initWithAddress:@"http://team3926.org"];
    [self.navigationController pushViewController:webViewController animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
