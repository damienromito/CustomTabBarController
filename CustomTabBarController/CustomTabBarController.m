//
//  CustomTabBarController.m
//  CustomTabBarController
//
//  Created by Damien Romito on 21/02/2014.
//  Copyright (c) 2014 Damien Romito. All rights reserved.
//

#import "CustomTabBarController.h"

@interface CustomTabBarController ()
@property (nonatomic,strong) UIView* viewsContainer ;
@property (nonatomic,strong) UITabBar* tabBar ;
@property (nonatomic,strong) UIViewController* vc1;
@property (nonatomic,strong) UIViewController* vc2;
@end

@implementation CustomTabBarController


- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"CustomTabBarController";
    }
    return self;
}
- (void)viewDidLoad
{

    [super viewDidLoad];

    self.navigationController.navigationBarHidden = YES;
    self.viewsContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height-50)];
    self.viewsContainer.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.viewsContainer];

}

- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}


- (void)setViewControllers:(NSArray *)viewControllers
{
    _viewControllers = viewControllers;
    
    self.tabBar = [[UITabBar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 50, 320,50)];
    self.tabBar.backgroundColor = [UIColor redColor];
    self.tabBar.delegate = self;
    
    NSMutableArray* items = [[NSMutableArray alloc] initWithCapacity:self.viewControllers.count];
    NSInteger i = 0;
    
    for (UIViewController* vc in self.viewControllers)
    {
        
        //Create Button
        UITabBarItem * item =  [[UITabBarItem alloc] initWithTitle:vc.title image:[[UIImage alloc] init] tag:i];
        [items addObject:item];
        i++;
        
    }
    
    self.tabBar.items = items;
    [self.view addSubview:self.tabBar];
    [self displayContentController:[self.viewControllers objectAtIndex:0]];
}


- (void) displayContentController: (UIViewController*) content;
{
    
    NSLog(@"SUBVIEW COUNT %i", [self.viewsContainer subviews].count);
    [self addChildViewController:content];                 // 1
    content.view.frame = CGRectMake(0, 0, 320, self.viewsContainer.frame.size.height); // 2
    [self.viewsContainer addSubview:content.view];
    [content didMoveToParentViewController:self];          // 3
    
//    Here’s what the code does:
//    
//    1 - It calls the container’s addChildViewController: method to add the child. Calling the addChildViewController: method also calls the child’s willMoveToParentViewController: method automatically.
//    2 - It accesses the child’s view property to retrieve the view and adds it to its own view hierarchy. The container sets the child’s size and position before adding the view; containers always choose where the child’s content appears. Although this example does this by explicitly setting the frame, you could also use layout constraints to determine the view’s position.
//    3 - It explicitly calls the child’s didMoveToParentViewController: method to signal that the operation is complete.
//
//    Eventually, you want to be able to remove the child’s view from the view hierarchy. In this case, shown in Listing 14-2, you perform the steps in reverse.
//    

}

- (void) hideContentController: (UIViewController*) content
{
    [content willMoveToParentViewController:nil];  // 1
    [content.view removeFromSuperview];            // 2
    [content removeFromParentViewController];      // 3
    
//    1 - Calls the child’s willMoveToParentViewController: method with a parameter of nil to tell the child that it is being removed.
//    2 - Cleans up the view hierarchy.
//    3 - Calls the child’s removeFromParentViewController method to remove it from the container. Calling the removeFromParentViewController method automatically calls the child’s didMoveToParentViewController: method
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
    
    [self displayContentController:[self.viewControllers objectAtIndex:item.tag]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
