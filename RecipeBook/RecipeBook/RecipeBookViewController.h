//
//  RecipeBookViewController.h
//  RecipeBook
//
//  Created by Blake Simpson on 5/20/13.
//  Copyright (c) 2013 Blake Simpson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeBookViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableViewObj;

@end
