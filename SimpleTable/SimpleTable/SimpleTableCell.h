//
//  SimpleTableCell.h
//  SimpleTable
//
//  Created by Blake Simpson on 5/20/13.
//  Copyright (c) 2013 Blake Simpson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell
    @property (nonatomic, weak) IBOutlet UILabel *nameLabel;
    @property (nonatomic, weak) IBOutlet UILabel *prepTimeLabel;
    @property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;
@end
