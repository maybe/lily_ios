//
//  ArticleTitleTableViewCell.h
//  LilyBBS
//
//  Created by panda on 11-11-27.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleTitleTableViewCell : UITableViewCell{
  UILabel* titleLabel;
  UILabel* boardLabel;
  UILabel* authorLabel;
  UILabel* renqiLabel;
  UILabel* numberLabel;
  UILabel* dateLabel;
}

@property (nonatomic, retain) UILabel* titleLabel;
@property (nonatomic, retain) UILabel* boardLabel;
@property (nonatomic, retain) UILabel* authorLabel;
@property (nonatomic, retain) UILabel* renqiLabel;
@property (nonatomic, retain) UILabel* numberLabel;
@property (nonatomic, retain) UILabel* dateLabel;

@end
