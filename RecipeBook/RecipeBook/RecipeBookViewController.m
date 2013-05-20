//
//  RecipeBookViewController.m
//  RecipeBook
//
//  Created by Blake Simpson on 5/20/13.
//  Copyright (c) 2013 Blake Simpson. All rights reserved.
//

#import "RecipeBookViewController.h"
#import "RecipeDetailViewController.h"

@interface RecipeBookViewController ()

@end

@implementation RecipeBookViewController {
    NSArray *recipes;
    NSArray *searchResults;
}

@synthesize tableViewObj;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Set data manually
    recipes = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ( tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
    } else {
        return [recipes count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"RecipeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSArray *dataArray = (tableView == self.searchDisplayController.searchResultsTableView) ? searchResults : recipes;
    cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
}

- (void)filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@", searchText];
    searchResults = [recipes filteredArrayUsingPredicate:resultPredicate];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        RecipeDetailViewController *destViewController = segue.destinationViewController;
        NSIndexPath *indexPath;
        NSArray *dataArray;
        
        if ([self.searchDisplayController isActive]) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            dataArray = searchResults;
        } else {
            indexPath = [self.tableViewObj indexPathForSelectedRow];
            dataArray = recipes;
        }
        
        destViewController.recipeName = [dataArray objectAtIndex:indexPath.row];
        destViewController.hidesBottomBarWhenPushed = YES;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( tableView == self.searchDisplayController.searchResultsTableView) {
        [self performSegueWithIdentifier:@"showRecipeDetail" sender:self];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
