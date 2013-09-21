//
//  centerViewController.h
//  testSlideView
//
//  Created by yhnbvfrt on 13-9-10.
//  Copyright (c) 2013年 yhnbvfrt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"

@interface centerViewController : UIViewController<IIViewDeckControllerDelegate>
{
    IBOutlet UIButton *lefttoggleBtn;
    BOOL leftViewOpen;
}


@end
