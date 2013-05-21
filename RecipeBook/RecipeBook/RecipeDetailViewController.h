//
//  RecipeDetailViewContoller.h
//  RecipeBook
//
//  Created by Blake Simpson on 5/20/13.
//  Copyright (c) 2013 Blake Simpson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h";

@interface RecipeDetailViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *ingredientDetailsLabel;
@property (nonatomic, weak) IBOutlet UILabel *prepTimeLabel;
@property (nonatomic, strong) IBOutlet UIImageView *photo;
@property (nonatomic, strong) Recipe *recipe;

@end
