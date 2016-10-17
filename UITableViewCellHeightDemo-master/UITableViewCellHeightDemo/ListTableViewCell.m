//
//  ListTableViewCell.m
//  UITableViewCellHeightDemo
//
//  Created by lisong on 2016/10/8.
//  Copyright © 2016年 lisong. All rights reserved.
//

#import "ListTableViewCell.h"

@interface ListTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *desclabel;

@end

@implementation ListTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setModel:(ListModel *)model
{
    _model = model;
    
    self.iconImageView.image = [UIImage imageNamed:@"image.jpg"];
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.layer.cornerRadius = 40;
    self.iconImageView.layer.borderWidth = 1.0;
    
    CGColorSpaceRef colorSpace =CGColorSpaceCreateDeviceRGB();
    CGColorRef colorRef = CGColorCreate(colorSpace, (CGFloat[]){1,0,0,1});
    self.iconImageView.layer.borderColor = colorRef;
    
    
    self.desclabel.text = model.desc;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef contex = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(contex,0.5,0.5,1,1.0);//画笔线的颜色
    CGContextSetLineWidth(contex, 5.0);//线的宽度
    CGContextMoveToPoint(contex, 0, rect.size.height-5);
    CGContextAddLineToPoint(contex, rect.size.width, rect.size.height-5);
    CGContextStrokePath(contex);

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
