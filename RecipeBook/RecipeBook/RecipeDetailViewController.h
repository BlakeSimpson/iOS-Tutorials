//
//  RecipeDetailViewContoller.h
//  RecipeBook
//
//  Created by Blake Simpson on 5/20/13.
//  Copyright (c) 2013 Blake Simpson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeDetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *recipeLabel;
@property (nonatomic, strong) NSString *recipeName;

@end
