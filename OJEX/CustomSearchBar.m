//
//  CustomSearchBar.m
//  OJEX
//
//  Created by alham fikri on 1/26/13.
//  Copyright (c) 2013 Badr Interactive. All rights reserved.
//

#import "CustomSearchBar.h"
#import <QuartzCore/QuartzCore.h>

@implementation CustomSearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Find the UISearchBarBackground view and set it's alpha to 0 so we get a "flat"
    // search bar.
    for( UIView *subview in self.subviews )
    {
        if( [subview isKindOfClass:NSClassFromString( @"UISearchBarBackground" )] )
        {
            UIView *aView = [[UIView alloc] initWithFrame:subview.bounds];
            aView.backgroundColor = [UIColor colorWithRed:255.0/255 green:255/255 blue:255/255 alpha:1];
            
             [subview addSubview:aView];
            //break;
        }
        if([subview isKindOfClass:[UITextField class]]){
            UITextField *tf= (UITextField *)subview;
            tf.layer.borderWidth = 0;
            // break;
        }
    }
    
   
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
