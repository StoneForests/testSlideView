//
//  AppDelegate.h
//  testSlideView
//
//  Created by yhnbvfrt on 13-9-10.
//  Copyright (c) 2013年 yhnbvfrt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"
#import "leftViewController.h"
#import "centerViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    leftViewController *leftViewCtrl;
    centerViewController *centerViewCtrl;
}

@property (strong, nonatomic) UIWindow *window;

@end
