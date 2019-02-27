/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

@import BraveRewardsUI;

#import "BraveRewardsTippingViewController.h"
#import "BATBraveLedger.h"

@interface BraveRewardsTippingViewController () <UIViewControllerTransitioningDelegate>
@property (nonatomic) BATBraveLedger *ledger;
@property (nonatomic) TippingView *view;
@end

@implementation BraveRewardsTippingViewController
@dynamic view;

- (instancetype)initWithLedger:(BATBraveLedger *)ledger publisherId:(NSString *)publisherId
{
  if ((self = [super initWithNibName:nil bundle:nil])) {
    self.ledger = ledger;
    
    self.modalPresentationStyle = UIModalPresentationOverFullScreen;
    self.transitioningDelegate = self;
  }
  return self;
}

- (void)loadView
{
  self.view = [[TippingView alloc] initWithFrame:[UIScreen mainScreen].bounds];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self.view.dismissButton addTarget:self action:@selector(tappedDismissButton) forControlEvents:UIControlEventTouchUpInside];
}

- (void)tappedDismissButton
{
  [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
  if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
    return UIInterfaceOrientationMaskPortrait;
  }
  return UIInterfaceOrientationMaskAll;
}

#pragma mark - UIViewControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
  return [[BasicAnimationController alloc] initWithDelegate:self.view
                                                  direction:BasicAnimationDirectionPresenting];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
  return [[BasicAnimationController alloc] initWithDelegate:self.view
                                                  direction:BasicAnimationDirectionDismissing];
}

@end
