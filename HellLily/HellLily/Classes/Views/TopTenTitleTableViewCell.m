//
//  TopTenTitleTableViewCell.m
//  LilyBBS
//
//  Created by panda on 11-12-17.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "TopTenTitleTableViewCell.h"

@implementation TopTenTitleTableViewCell
@synthesize renqiLabel,numImage,titleLabel,boardLabel,authorLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
  // Initialization code  
  titleLabel = [[UILabel alloc] init];
  [titleLabel setFrame:CGRectMake(50, 0, 240, 44)];  
  [titleLabel setFont:[UIFont systemFontOfSize:14]];
  [titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
  [titleLabel setTextAlignment:NSTextAlignmentLeft];
  [titleLabel setNumberOfLines:2];
  [titleLabel setBackgroundColor: [UIColor clearColor]];

  boardLabel = [[UILabel alloc] init];  
  [boardLabel setFrame:CGRectMake(160, 38, 125, 20)];  
  [boardLabel setFont:[UIFont systemFontOfSize:12]];
  [boardLabel setBackgroundColor: [UIColor clearColor]];
  [boardLabel setTextAlignment:NSTextAlignmentRight];
  [boardLabel setTextColor:[UIColor colorWithRed:126.0f/255.0f green:126.0f/255.0f blue:126.0f/255.0f alpha:1.0f]];
  
  
  authorLabel = [[UILabel alloc] init]; 
  [authorLabel setFrame:CGRectMake(50, 38, 120, 20)];  
  [authorLabel setFont:[UIFont systemFontOfSize:12]];
  [authorLabel setBackgroundColor: [UIColor clearColor]];
  [authorLabel setTextColor:[UIColor colorWithRed:126.0f/255.0f green:126.0f/255.0f blue:126.0f/255.0f alpha:1.0f]];

  
  [self.contentView addSubview: titleLabel];
  [self.contentView addSubview: boardLabel];
  [self.contentView addSubview: authorLabel];
  
  renqiLabel = [[UILabel alloc]init];
  
  numImage = [[UIImageView alloc]init];
  [numImage setFrame:CGRectMake(16, 15, 30, 30)];
  
  [self addSubview:numImage];
  [self addSubview:authorLabel];
  [self addSubview:titleLabel];
  [self addSubview:boardLabel];
  
  [self setBackgroundColor:[UIColor clearColor]];
  [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
  
    return self;
}

- (void)setImageNumber:(NSInteger)num
{
  [numImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"number%d.png", num]]];
}

@end
