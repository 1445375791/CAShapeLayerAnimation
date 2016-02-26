//
//  ViewController.m
//  TestDrawer
//
//  Created by 吴朋 on 16/2/25.
//  Copyright © 2016年 吴朋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(110, 100, 150, 100)];
//    CGFloat radius = 60.0;
//    CGFloat startAngle = 0.0;
//    CGFloat endAngle = M_PI * 2;
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
//    
//    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
////    layer.frame = CGRectMake(110, 100, 150, 100);
//    layer.lineWidth = 2.0;
//    layer.path = path.CGPath;
//    layer.fillColor = [UIColor whiteColor].CGColor;
//    layer.strokeColor = [UIColor cyanColor].CGColor;
//    
//    [self.view.layer addSublayer:layer];
    [self drawBezierLine];
    
}

- (void)drawBezierLine {
    
    CGPoint startPoint = CGPointMake(50, 300);
    CGPoint endPoint = CGPointMake(300, 300);
    CGPoint controlPoint = CGPointMake(150, 200);
    CGPoint controlPoint1 = CGPointMake(190, 400);
    
    CALayer *layer1 = [[CALayer alloc] init];
    layer1.frame = CGRectMake(startPoint.x, startPoint.y, 5, 5);
    layer1.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer2 = [[CALayer alloc] init];
    layer2.frame = CGRectMake(endPoint.x, endPoint.y, 5, 5);
    layer2.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer3 = [[CALayer alloc] init];
    layer3.frame = CGRectMake(controlPoint.x, controlPoint.y, 5, 5);
    layer3.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer4 = [[CALayer alloc] init];
    layer4.frame = CGRectMake(controlPoint1.x, controlPoint1.y, 5, 5);
    layer4.backgroundColor = [UIColor redColor].CGColor;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    [path moveToPoint:startPoint];
//    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    [path addCurveToPoint:endPoint controlPoint1:controlPoint controlPoint2:controlPoint1];
    
    layer.path = path.CGPath;
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.strokeColor = [UIColor blackColor].CGColor;

    [self.view.layer addSublayer:layer];
//    [self.view.layer addSublayer:layer1];
//    [self.view.layer addSublayer:layer2];
//    [self.view.layer addSublayer:layer3];
//    [self.view.layer addSublayer:layer4];
    
    
    [self animation1:layer];
//    [self animation2:layer];
    [self animation3:layer];
}

/**
 *  绘制从左往右的动画
 *
 *  @param layer <#layer description#>
 */
- (void)animation1:(CAShapeLayer *)layer {
 
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 4;
    [layer addAnimation:animation forKey:@""];
}

/**
 *  绘制从中间到两边的动画
 *
 *  @param layer <#layer description#>
 */
- (void)animation2:(CAShapeLayer *)layer {
    
    layer.strokeStart = 0.5;
    layer.strokeEnd = 0.5;
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation1.fromValue = @0.5;
    animation1.toValue = @0;
    animation1.duration = 2;
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation2.fromValue = @0.5;
    animation2.toValue = @1;
    animation2.duration = 2;
    
    [layer addAnimation:animation1 forKey:@""];
    [layer addAnimation:animation2 forKey:@""];
}

/**
 *  绘制从左往右 先变粗的动画
 *
 *  @param layer <#layer description#>
 */
- (void)animation3:(CAShapeLayer *)layer {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
    animation.fromValue = @1;
    animation.toValue = @10;
    animation.duration = 4;
    [layer addAnimation:animation forKey:@""];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
