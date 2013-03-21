//
//  QViewController.h
//  CATransform3DDemo
//
//  Created by liubinbin on 13-3-20.
//  Copyright (c) 2013年 liubinbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface QViewController : UIViewController
{
    CGMutablePathRef starPath;
}
@property (retain, nonatomic) IBOutlet UIImageView *demoImage;

@end
