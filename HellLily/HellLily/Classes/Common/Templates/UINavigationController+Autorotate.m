#import "UINavigationController+Autorotate.h"
#import "REFrostedViewController.h"

@implementation UINavigationController (Autorotate)

-(BOOL)shouldAutorotate
{
    if ([self.viewControllers.lastObject isKindOfClass:[REFrostedViewController class]]) {
        return NO;
    }
    
    return [self.viewControllers.lastObject shouldAutorotate];
}

-(NSUInteger)supportedInterfaceOrientations
{
  NSUInteger result = [self.viewControllers.lastObject supportedInterfaceOrientations];
  return result;
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
  UIInterfaceOrientation result = [self.viewControllers.lastObject preferredInterfaceOrientationForPresentation];
  if (result == 0) {
    result = UIInterfaceOrientationPortrait;
  }
  return result;
}

//for iOS5
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return [self.viewControllers.lastObject shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

@end
