//
//  CustomTabBarController.h
//  CustomTabBarController
//
//  Created by Damien Romito on 21/02/2014.
//  Copyright (c) 2014 Damien Romito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTabBarController : UIViewController<UITabBarDelegate>
@property (nonatomic,strong) NSArray* viewControllers;
@end
