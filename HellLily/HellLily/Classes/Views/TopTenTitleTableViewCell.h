//
//  TopTenTitleTableViewCell.h
//  LilyBBS
//
//  Created by panda on 11-12-17.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopTenTitleTableViewCell : UITableViewCell
{
  UILabel* titleLabel;
  UILabel* boardLabel;
  UILabel* authorLabel;
  UILabel* renqiLabel;
  UIImageView* numImage;
}

@property (nonatomic, retain) UILabel* renqiLabel;
@property (nonatomic, retain) UIImageView* numImage;
@property (nonatomic, retain) UILabel* titleLabel;
@property (nonatomic, retain) UILabel* boardLabel;
@property (nonatomic, retain) UILabel* authorLabel;

- (void) setImageNumber:(NSInteger)num;

@end
