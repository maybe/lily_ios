//
//  TopTenController.m
//  HellLily
//
//  Created by panda on 10/20/13.
//  Copyright (c) 2013 VeryPanda. All rights reserved.
//

#import "TopTenController.h"
#import "NetManager.h"
#import "User.h"
#import "TopTenTitleTableViewCell.h"

@interface TopTenController ()

@end

@implementation TopTenController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString* notifName = [NSString stringWithFormat:@"NetCB%d", RNT_TopTen];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData) name:notifName object:nil];
    
    contentArray = [[NSMutableArray alloc]init];
    
    self.title = @"十大";
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self grabURLInBackground];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return contentArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"aTableView";
    TopTenTitleTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:
                                      CellIdentifier];
    if (cell == nil) {
        cell = (TopTenTitleTableViewCell *)[[TopTenTitleTableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    
    [cell setImageNumber:row+1];
    
    cell.titleLabel.text = [[contentArray objectAtIndex:row] title];
    cell.authorLabel.text = [NSString stringWithFormat:@"作者:%@", [[contentArray objectAtIndex:row] author]];
    cell.boardLabel.text = [NSString stringWithFormat:@"讨论区:%@", [[contentArray objectAtIndex:row] board]];
    
    return cell;
}

- (void)reloadData
{
    [contentArray removeAllObjects];
    User* user = [User sharedInstance];
    [contentArray addObjectsFromArray:user.ttd.titleList];
    
    [self.tableView reloadData];
}

#pragma mark - grab url
- (void)grabURLInBackground
{
    NSString *url = @"http://bbs.nju.edu.cn/bbstop10";
    [[NetManager sharedInstance] requestURL:url parameters:nil withType: RNT_TopTen];
}

@end
