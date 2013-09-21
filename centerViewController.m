//
//  centerViewController.m
//  testSlideView
//
//  Created by yhnbvfrt on 13-9-10.
//  Copyright (c) 2013年 yhnbvfrt. All rights reserved.
//

#import "centerViewController.h"

@interface centerViewController ()

@end

@implementation centerViewController

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
//    ((leftViewController*)self.viewDeckController.leftController).tabDelegate=self;
    [super viewDidLoad];
    leftViewOpen = NO;
    // Do any additional setup after loading the view from its nib.
    [lefttoggleBtn addTarget:self action:@selector(btnRotateToggleLeftView) forControlEvents:UIControlEventTouchUpInside];
    self.viewDeckController.panningMode = IIViewDeckNoPanning;
    self.viewDeckController.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(btnRotateToggleLeftView) name:@"btnRotateToggleLeftView" object:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (leftViewOpen == YES)
    {
        [self btnRotateToggleLeftView];
    }

}

-(void)btnRotateToggleLeftView
{
    leftViewOpen = !leftViewOpen;

    [self.viewDeckController toggleLeftView];
    [UIView animateWithDuration:0.1
                     animations:^{
                         lefttoggleBtn.transform = CGAffineTransformMakeRotation(leftViewOpen * M_PI_2);
                     }
                     completion:^(BOOL finished){
                     }];
}

@end
