//
//  TableViewCell.m
//  customcell1
//
//  Created by  陈鲲鹏 on 14-10-11.
//  Copyright (c) 2014年  陈鲲鹏. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

@synthesize image;
@synthesize name;
@synthesize dec;
@synthesize loc;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setImage:(UIImage *)image{
    if(![image isEqual:self.image]){
        self.image = [image copy];
        imageview.image = self.image;
    }
}

- (void)setName:(NSString *)name{
    if(![name isEqual:self.name]){
        self.name = [name copy];
        namelabel.text = self.name;
    }
}

- (void)setDec:(NSString *)dec{
    if(![dec isEqual:self.dec]){
        self.dec = [dec copy];
        declabel.text = self.dec;
    }
}

- (void)setLoc:(NSString *)loc{
    if(! [loc isEqual:self.loc]){
        self.loc = [loc copy];
        loclabel.text = loc;
    }
    
}
@end
