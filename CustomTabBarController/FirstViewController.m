//
//  FirstViewController.m
//  CustomTabBarController
//
//  Created by Damien Romito on 21/02/2014.
//  Copyright (c) 2014 Damien Romito. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstDetailViewController.h"

@interface FirstViewController ()
@property (nonatomic,strong) NSArray* items;
@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.items = [[NSArray alloc] initWithObjects:@"Damien", @"Gilles", @"Loïck",@"Adrien", @"Tony", @"Jie", nil];
    
    [self.tableView reloadData];
	// Do any additional setup after loading the view.

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* CellIdentifier = @"CellIdentifier";
    
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [self.items objectAtIndex:indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FirstDetailViewController* fd = [[FirstDetailViewController alloc] initWithTitle:[self.items objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:fd animated:YES];
}

@end
