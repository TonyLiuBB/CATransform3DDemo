//
//  QViewController.m
//  CATransform3DDemo
//
//  Created by liubinbin on 13-3-20.
//  Copyright (c) 2013年 liubinbin. All rights reserved.
//

#import "QViewController.h"
//#define degreesToRadianss(degrees) (M_PI * degrees / 180.0)
#define DegreesToNumber(degrees) degrees

@interface QViewController ()

@end

@implementation QViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}

- (IBAction)btn1:(id)sender
{
    [self demo1];
}

- (IBAction)btn2:(id)sender {
    [self demo2];
}

//demo1
- (void)demo1
{
    CGFloat degrees = 30.0 * M_PI / 180.0;
    
    CGFloat distanceToRotationPoint = 100.0;//距离旋转点的坐标
    
    CATransform3D externalRotation = CATransform3DIdentity;
    
    externalRotation = CATransform3DMakeTranslation(distanceToRotationPoint, 0.0F, 0.0f);//平移
    
    externalRotation = CATransform3DRotate(externalRotation, degrees, 0.0, 0.0, 1.0);
    
    externalRotation = CATransform3DTranslate(externalRotation, distanceToRotationPoint, 0.0, 0.0);
    
    self.demoImage.layer.transform = externalRotation;
    
    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    rotate.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    
    rotate.toValue = [NSValue valueWithCATransform3D:externalRotation];
    
    rotate.duration = 1.0;
    
    [self.demoImage.layer addAnimation:rotate forKey:@"myRotationAnimation"];
}

//demo2
- (void)demo2
{
    CGPoint rotation = CGPointMake(48, 275);
    CGPoint anchorPoint = CGPointMake((rotation.x - CGRectGetMinX(self.view.frame))/CGRectGetWidth(self.view.frame),((rotation.y - CGRectGetMinY(self.view.frame))/CGRectGetHeight(self.view.bounds)));
    self.view.layer.anchorPoint = anchorPoint;
    self.view.layer.position = rotation;
    
    CGFloat degrees = 30.0 * M_PI / 180.0;
    
    CGFloat distanceToRotationPoint = 100.0;//距离旋转点的坐标
    
    CATransform3D externalRotation = CATransform3DIdentity;
    
    externalRotation = CATransform3DMakeTranslation(distanceToRotationPoint, 0.0F, 0.0f);//平移
    
    externalRotation = CATransform3DRotate(externalRotation, degrees, 0.0, 0.0, 1.0);
    
    externalRotation = CATransform3DTranslate(externalRotation, distanceToRotationPoint, 0.0, 0.0);
    
    self.demoImage.layer.transform = externalRotation;
    
    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    
    
    rotate.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];//从CATransform3DIdentity到@(-M_PI_2)
    
    rotate.toValue = @(-M_PI_2);
    
    rotate.duration = 2.0;
    
    [self.demoImage.layer addAnimation:rotate forKey:@"transform.rotation.z"];
    
    
}

- (IBAction)demo3:(id)sender
{
//    你可以做动画的颜色属性有
//    backgroundColor,层的背景颜色
//    borderColor,层的边框颜色
//    shadowColor,层的阴影颜色
    
    //创建了一个基础的动画对象 CABasicAnimation,使用了关键路径 backgroundColor,并且通 过 setFromValue 和 setToValue 为它设定了参数。通过 setDuration:5.0 设置了执行时间为 5 秒
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    
    
    
    [anim setDuration:5.0];
    
    //CGColorRef red = CGColorCreateGenericRGB(1.0, 0.0, 0.0, 1.0);
    
    [anim setFromValue:(id)[[UIColor redColor] CGColor]];
    
    [anim setToValue:(id)[[UIColor greenColor] CGColor]];
    
    //层是一个模型对象,而不是一个视图对象
    //通过调用 addAnimation:forKeyPath 这个方法,来增加动画对象到层中,这样就能触发动画了
    [self.view.layer addAnimation:anim forKey:@"backgroundColor"];
    
//    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
//    const CGFloat red[] = {1.0, 0.0, 0.0, 1.0};
//    CGColorCreate(rgb, red);
//    CGColorSpaceRelease(rgb);
//    
//    CGColorSpaceRef rgbs = CGColorSpaceCreateDeviceRGB();
//    const CGFloat green[] = {0.0, 1.0, 0.0, 1.0};
//    CGColorCreate(rgbs, green);
//    CGColorSpaceRelease(rgbs);
//    
//    [anim setFromValue:(id)rgb];
//    [anim setToValue:(id)rgbs];
    
    //CFRelease(red);
    //CFRelease(green);
    
}

- (IBAction)btn4:(id)sender
{
    //居中,zPosition 控制层的 z 轴。这决定了层从前到后的位置。它能做这样的动画,在一个层的顶部转换出一个层
    
    [self.demoImage.layer setPosition:CGPointMake((self.view.frame.size.width/2.0), (self.view.frame.size.height/2.0))];
    //默认的锚点是 0.5,0.5,表示在层的中间。如果你改变锚点为 0.0,0.0,那么层的锚点就移动到了左上角
    [self.demoImage.layer setAnchorPoint:CGPointMake(0.0, 0.0)];
    
    //Opacity 属性决定层的透明度。1.0 代表层不透明,0.0 代表全透明
    self.demoImage.layer.opacity = 0.5;
    
//    有时候你想用层装饰你的视图,因为这样在视觉上提升了视图的效果。例如,当一些数据从网络上下载 时,你想展示一个进度条,你可以在界面设计中(interface builder),设计这样的视图,然后放置一个进度条 到视图中。然后你可以通过设定 cornerRadius 和 borderwidth 两个属性,使视图有一个边框和一个圆角的矩阵
}

static int count = 0;

- (IBAction)btn5:(id)sender
{
    
//    CGRect newframe = CGRectMake(208, 250, 80, 50);
//    
//    CABasicAnimation *rectAnimation = [CABasicAnimation animationWithKeyPath:@"frameRect"];
//    
//    [rectAnimation setFromValue:[NSValue valueWithCGRect:self.demoImage.frame]];
//    
//    [rectAnimation setToValue:[NSValue valueWithCGRect:newframe]];
//    
//    [rectAnimation setDuration:5.0];
//    
//    [self.demoImage.layer addAnimation:rectAnimation forKey:@"frameRect"];
    if (count%2==0) {
        [self showParabolic];
    }
    else
    {
      [self showStraight];  
    }
    
    
    count ++ ;
    
}

//抛物线
//path animation patter使用路径模式
- (void)showParabolic
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path,nil,50.0,120.0);
    CGPathAddCurveToPoint(path,nil,50.0,275.0,150.0,275.0,150.0,120.0);
    CGPathAddCurveToPoint(path,nil,150.0,275.0,250.0,275.0,250.0,120.0);
    CGPathAddCurveToPoint(path,nil,250.0,275.0,350.0,275.0,350.0,120.0);
    CGPathAddCurveToPoint(path,nil,350.0,275.0,450.0,275.0,450.0,120.0);
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [animation setPath:path];
    [animation setDuration:3.0];
    [animation setAutoreverses:YES];
    [self.demoImage.layer addAnimation:animation forKey:@"position"];
    CFRelease(path);
}

//直线
//values animation patter 这种模式时在用更多的点来获得接近上面路径的模式，但是用路径更加方便
- (void)showStraight
{
    CGPoint pt0 = CGPointMake(50.0, 120.0);//CGMakePoint(50.0, 120.0);
    CGPoint pt1 = CGPointMake(50.0, 275.0);
    CGPoint pt2 = CGPointMake(150.0, 275.0);
    CGPoint pt3 = CGPointMake(150.0, 120.0);
    CGPoint pt4 = CGPointMake(150.0, 275.0);
    CGPoint pt5 = CGPointMake(250.0, 275.0);
    CGPoint pt6 = CGPointMake(250.0, 120.0);
    CGPoint pt7 = CGPointMake(250.0, 275.0);
    CGPoint pt8 = CGPointMake(350.0, 275.0);
    CGPoint pt9 = CGPointMake(350.0, 120.0);
    CGPoint pt10 = CGPointMake(350.0, 275.0);
    CGPoint pt11 = CGPointMake(450.0, 275.0);
    CGPoint pt12 = CGPointMake(450.0, 120.0);
    NSArray *values = [NSArray arrayWithObjects: [NSValue valueWithCGPoint:pt0],
                                                                                                                                                                                                                                                                                                                         [NSValue valueWithCGPoint:pt1], [NSValue valueWithCGPoint:pt2], [NSValue valueWithCGPoint:pt3], [NSValue valueWithCGPoint:pt4], [NSValue valueWithCGPoint:pt5], [NSValue valueWithCGPoint:pt6], [NSValue valueWithCGPoint:pt7], [NSValue valueWithCGPoint:pt8], [NSValue valueWithCGPoint:pt9], [NSValue valueWithCGPoint:pt10], [NSValue valueWithCGPoint:pt11], [NSValue valueWithCGPoint:pt12], nil];
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [animation setValues:values];
    [animation setDuration:3.0];
    [animation setAutoreverses:YES];
    [self.demoImage.layer addAnimation:animation forKey:@"position"];
}


- (IBAction)btn6:(id)sender
{
    [self showStar];
}

- (void)showStar
{
    if (starPath) {
        [self.demoImage.layer setNeedsDisplay];
    }
    starPath = CGPathCreateMutable();
    CGPathMoveToPoint(starPath,nil,240.0, 280.0);
    CGPathAddLineToPoint(starPath, nil, 181.0, 99.0);
    CGPathAddLineToPoint(starPath, nil, 335.0, 210.0);
    CGPathAddLineToPoint(starPath, nil, 144.0, 210.0);
    CGPathAddLineToPoint(starPath, nil, 298.0, 99.0);
    CGPathCloseSubpath(starPath);
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [animation setDuration:10.0f];
    [animation setDelegate:self];
    
    [animation setPath:starPath];
    
    [self.demoImage.layer addAnimation:animation forKey:@"position"];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(legOne:)
                                   userInfo:nil
                                    repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:4.0
                                     target:self
                                   selector:@selector(legTwo:)
                                   userInfo:nil
                                    repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:6.0
                                     target:self
                                   selector:@selector(legThree:)
                                   userInfo:nil
                                    repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:8.0
                                     target:self
                                   selector:@selector(legFour:)
                                   userInfo:nil
                                    repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:10.0
                                     target:self
                                   selector:@selector(legFive:)
                                   userInfo:nil
                                    repeats:NO];
    
    [self.demoImage.layer setNeedsDisplay];
}

//当每个时间到达时,另一个点就会被增加到 starpath 路径中,然后根层就会更新显示。 最后调用 legFive 方法,关闭路径

- (void)legOne:(id)sender
{
    CGPathAddLineToPoint(starPath, nil, 181.0, 99.0);
    [[self.demoImage layer] setNeedsDisplay];
}
- (void)legTwo:(id)sender
{
    CGPathAddLineToPoint(starPath, nil, 335.0, 210.0);
    [[self.demoImage layer] setNeedsDisplay];
}
- (void)legThree:(id)sender
{
    CGPathAddLineToPoint(starPath, nil, 144.0, 210.0);
    [[self.demoImage layer] setNeedsDisplay];
}
- (void)legFour:(id)sender
{
    CGPathAddLineToPoint(starPath, nil, 298.0, 99.0);
    [[self.demoImage layer] setNeedsDisplay];
}
- (void)legFive:(id)sender
{
    CGPathCloseSubpath(starPath);
    [[self.demoImage layer] setNeedsDisplay];
}
//#define DegreesToNumber(x) (M_PI * x / 180.0)

//iphone抖动动画
- (CAAnimation*)shakeAnimation
{
    CAKeyframeAnimation *shakeAnima = [CAKeyframeAnimation animationWithKeyPath:@"shakeAnimation"];
    [shakeAnima setDuration:0.5];
    [shakeAnima setRepeatCount:1000.0];
    float rand = (float)random();
    [shakeAnima setBeginTime:CACurrentMediaTime()+rand*.0000000001];
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:DegreesToNumber(-2)];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_demoImage release];
    [super dealloc];
}
@end
