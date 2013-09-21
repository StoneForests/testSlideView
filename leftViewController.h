//
//  leftViewController.h
//  testSlideView
//
//  Created by yhnbvfrt on 13-9-10.
//  Copyright (c) 2013年 yhnbvfrt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"
#import "addViewController.h"

@interface leftViewController : UITableViewController
{
    NSMutableArray *listLeftView;
    UIButton *btnAddCity;
    BOOL btnAddCityClick;
}
@property (strong, nonatomic) addViewController *addCtrl;

@end
