//
//  ArticleTitleTableViewCell.m
//  LilyBBS
//
//  Created by panda on 11-11-27.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ArticleTitleTableViewCell.h"

@implementation ArticleTitleTableViewCell
@synthesize titleLabel,boardLabel,authorLabel,dateLabel,renqiLabel,numberLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      
    //  [self setFrame: CGRectMake(0, 0, 320, 60)];
      [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    //  [self setBackgroundColor:[UIColor clearColor]];
      
      // Initialization code  
      titleLabel = [[UILabel alloc] initWithFrame: CGRectMake(40, 0, 258, 44)];
      [titleLabel setFont:[UIFont systemFontOfSize:14]];
      [titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
      [titleLabel setTextAlignment:NSTextAlignmentLeft];
      [titleLabel setNumberOfLines:2];
      [titleLabel setBackgroundColor: [UIColor clearColor]];

      authorLabel = [[UILabel alloc] initWithFrame: CGRectMake(40, 38, 150, 20)];  
      [authorLabel setFont:[UIFont systemFontOfSize:12]];
      [authorLabel setBackgroundColor: [UIColor clearColor]];
      [authorLabel setTextColor:[UIColor colorWithRed:126.0f/255.0f green:126.0f/255.0f blue:126.0f/255.0f alpha:1.0f]];
      
      numberLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 20, 40, 20)];
      [numberLabel setFont:[UIFont systemFontOfSize:11]];
      [numberLabel setBackgroundColor: [UIColor clearColor]];
      [numberLabel setTextColor: [UIColor colorWithRed:126.0f/255.0f green:126.0f/255.0f blue:126.0f/255.0f alpha:1.0f]];
      [numberLabel setTextAlignment:NSTextAlignmentCenter];
      
      boardLabel = [[UILabel alloc] initWithFrame: CGRectMake(40, 38, 150, 20)];  
      [boardLabel setFont:[UIFont systemFontOfSize:12]];
      [boardLabel setBackgroundColor: [UIColor clearColor]];
      [boardLabel setTextColor:[UIColor colorWithRed:126.0f/255.0f green:126.0f/255.0f blue:126.0f/255.0f alpha:1.0f]];
      
      dateLabel = [[UILabel alloc] initWithFrame: CGRectMake(165, 38, 115, 20)];  
      [dateLabel setFont:[UIFont systemFontOfSize:12]];
      [dateLabel setBackgroundColor: [UIColor clearColor]];
      [dateLabel setTextColor:[UIColor colorWithRed:126.0f/255.0f green:126.0f/255.0f blue:126.0f/255.0f alpha:1.0f]];
      
      renqiLabel = [[UILabel alloc] initWithFrame: CGRectMake(200, 38, 95, 20)]; 
      [renqiLabel setFont:[UIFont systemFontOfSize:12]];
      [renqiLabel setBackgroundColor: [UIColor clearColor]];
      [renqiLabel setTextColor:[UIColor colorWithRed:0.0f/255.0f green:91.0f/255.0f blue:136.0f/255.0f alpha:1.0f]];     
      [renqiLabel setTextAlignment:NSTextAlignmentRight];
      
      [self.contentView addSubview: titleLabel];
      [self.contentView addSubview: boardLabel];
      [self.contentView addSubview: authorLabel];
      [self.contentView addSubview: numberLabel];
      [self.contentView addSubview:renqiLabel];
      [self.contentView addSubview:dateLabel];
      
    }
    return self;
}

@end
