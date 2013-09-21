//
//  leftViewController.m
//  testSlideView
//
//  Created by yhnbvfrt on 13-9-10.
//  Copyright (c) 2013年 yhnbvfrt. All rights reserved.
//

#import "leftViewController.h"

@interface leftViewController ()

@end

@implementation leftViewController

@synthesize addCtrl;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    btnAddCityClick = NO;
    addCtrl = [[addViewController alloc] init];
    NSMutableArray *listAddCity = [NSMutableArray arrayWithObjects:@"添加城市",nil];
    NSMutableArray *listOtherFunc = [NSMutableArray arrayWithObjects:@"更换皮肤",@"分享", nil];
    NSMutableArray *listCity = [NSMutableArray arrayWithObjects:@"武汉",@"深圳",@"上海", nil];
    listLeftView = [NSMutableArray  arrayWithObjects:listAddCity,listOtherFunc,listCity, nil];
    
    CGRect theFooterRect;
    
    theFooterRect.size.height -= 46;
    UIView * newFooterView = [[UIView alloc] initWithFrame:theFooterRect];
    self.tableView.tableFooterView = newFooterView;
    
//    listLeftView = [NSArray arrayWithObjects:@"wuhan",@"shenzhen", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
//    NSLog(@"%d",[listLeftView count]);
    return [listLeftView count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
//    NSLog(@"%d",[[listLeftView objectAtIndex:section] count]);
    return [[listLeftView objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
//    cell.textLabel.font = [UIFont systemFontOfSize:18];
//    cell.textLabel.text = [[listLeftView objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    UILabel *labelLeftView = [[UILabel alloc] initWithFrame:CGRectMake(20, 3, 100, 30)];
    labelLeftView.text = [[listLeftView objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    labelLeftView.textAlignment = NSTextAlignmentLeft;
    labelLeftView.font = cell.textLabel.font = [UIFont systemFontOfSize:18];
    [cell addSubview:labelLeftView];
    
    if(indexPath.section == 0)
    {
        btnAddCity = [UIButton buttonWithType:UIButtonTypeCustom];
        btnAddCity.frame = CGRectMake(225, 8, 20, 20);
        [btnAddCity setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"添加城市" ofType:@"png"]] forState: UIControlStateNormal];
        [btnAddCity addTarget:self action:@selector(addCity) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btnAddCity];
    }
    return cell;
}

-(void)addCity
{
    btnAddCityClick = !btnAddCityClick;
    
    if(btnAddCityClick)
    {
        self.viewDeckController.leftSize = 0;
    }
    else
    {
        self.viewDeckController.leftSize = 50;
    }
    addCtrl.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:addCtrl animated:YES completion:nil];
    [UIView animateWithDuration:0.1
                     animations:^{
                         if(btnAddCityClick)
                         {
                             btnAddCity.transform = CGAffineTransformMakeRotation( M_PI_4);
                         }
                         if (!btnAddCityClick) {
                             btnAddCity.transform = CGAffineTransformIdentity;
                         }
                         btnAddCity.center = CGPointMake(btnAddCityClick * 50 + 235, 21);
                     }
                     completion:^(BOOL finished){
                     }];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    if(indexPath.section == 2)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"btnRotateToggleLeftView" object:nil];
        
    }
    
//    UIButton btn
//    [[tableView cellForRowAtIndexPath:indexPath] addSubview:];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            break;
        case 1:
            return @" ";
        case 2:
            return @" ";
        default:
            break;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 36.0;
}
@end
