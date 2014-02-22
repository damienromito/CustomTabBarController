//
//  FirstDetailViewController.m
//  CustomTabBarController
//
//  Created by Damien Romito on 21/02/2014.
//  Copyright (c) 2014 Damien Romito. All rights reserved.
//

#import "FirstDetailViewController.h"

@interface FirstDetailViewController ()

@end

@implementation FirstDetailViewController

- (id)initWithTitle:(NSString*)title
{
    self = [super init];
    if (self) {
        self.title = title;
        self.view.backgroundColor = [UIColor blueColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
