//
//  TableViewCell.h
//  customcell1
//
//  Created by  陈鲲鹏 on 14-10-11.
//  Copyright (c) 2014年  陈鲲鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
{
__weak IBOutlet UIImageView *imageview;
__weak IBOutlet UILabel *namelabel;
__weak IBOutlet UILabel *declabel;
__weak IBOutlet UILabel *loclabel;
}
@property (copy,nonatomic) UIImage *image;
@property (copy,nonatomic) NSString *name;
@property (copy,nonatomic) NSString *dec;
@property (copy,nonatomic) NSString *loc;
@end
