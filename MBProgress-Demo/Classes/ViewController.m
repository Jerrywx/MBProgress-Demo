//
//  ViewController.m
//  MBProgress-Demo
//
//  Created by 王潇 on 16/10/25.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import "ViewController.h"
#import "JRProgressHUD.h"
#import <MBProgressHUD.h>

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView	*tableView;
@property (nonatomic, strong) MBProgressHUD	*hud;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self setupView];
}

- (void)setupView {
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	self.title = @"JRProgressHUD";
	
	self.tableView = ({
		UITableView *tableView	= [[UITableView alloc] initWithFrame:self.view.bounds];
		tableView.delegate		= self;
		tableView.dataSource	= self;
		[tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
		[self.view addSubview:tableView];
		tableView;
	});
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
	cell.textLabel.text = @"cell";
	return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	if (indexPath.section == 0) {
		if (indexPath.row == 2) {
			self.hud.label.text = @"asdasdsa";
		}
		
		if (indexPath.row == 1) {
			self.hud = [JRProgressHUD showHUDAddedTo:self.view
											   title:@"This is Test"
											animated:YES
											 hideAll:YES];
		} else {
			[JRProgressHUD hideHUDForView:self.view];
		}
	} else if (indexPath.section == 1) {
		if (indexPath.row == 0) {
			[JRProgressHUD showToastTo:self.view message:@"TTT"];
		}
		
		if (indexPath.row == 1) {
			[JRProgressHUD showToastTo:self.view
							   message:@"Toast!!!"
							 alignment:JRProgressAlignmentCenter
							afterDelay:2];
		}
		
		if (indexPath.row == 2) {
			[JRProgressHUD showToastTo:self.view
							   message:@"Toast!!!"
							 alignment:JRProgressAlignmentBottom
							afterDelay:1];
		}
	}
	
	
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
	return 20;
}

@end
