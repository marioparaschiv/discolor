#include <Foundation/Foundation.h>
#include <UIKit/UIKit.h>

#import "./headers/RCTBridge.h"
#import "./headers/RCTRootView.h"
#import "./headers/RCTCxxBridge.h"
#import "./headers/UIKeyboard.h"
#import "./headers/DCD.h"


UIColor* color(NSString *hex);

#define NSStringMultiline(...) [[NSString alloc] initWithCString:#__VA_ARGS__ encoding:NSUTF8StringEncoding]