//
//  ModelController.h
//  papajenkinsxcode1
//
//  Created by Sancheeta Paul on 12/8/14.
//  Copyright (c) 2014 parag paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end

