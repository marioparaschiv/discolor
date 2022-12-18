#include "Tweak.h"

%hook DCDUploadProgressView
  - (void)didMoveToWindow {
    %orig();

    UIView *subview = self.subviews[0];
    [subview setBackgroundColor:[UIColor blackColor]];
  }
%end

%group KEYBOARD
  %hook UIKeyboard
    - (void)didMoveToWindow {
      %orig();

      [self setBackgroundColor:[UIColor blackColor]];
    }
  %end

  %hook UIKeyboardDockView
    - (void)didMoveToWindow {
      %orig();

      [self setBackgroundColor:[UIColor blackColor]];
    }
  %end

  %hook UIKBRenderConfig
    - (void)setLightKeyboard:(BOOL)arg1 {
      %orig(NO);
    }
  %end

  %hook TUIPredictionView
    - (void)didMoveToWindow {
      %orig();

      [self setBackgroundColor:[UIColor blackColor]];

      for (UIView *subview in self.subviews) {
          [subview setBackgroundColor:[UIColor blackColor]];
      }
    }
  %end

  %hook TUIEmojiSearchInputView
    - (void)didMoveToWindow {
      %orig();

      [self setBackgroundColor:[UIColor blackColor]];
    }
  %end
%end

%ctor {
	%init

	NSBundle* bundle = [NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/TextInputUI.framework"];
	if (!bundle.loaded) [bundle load];
	%init(KEYBOARD);
}

UIColor* color(NSString *hex) {
	NSString *clean = [hex stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if ([clean length] == 3) {
        clean = [NSString stringWithFormat:@"%@%@%@%@%@%@",
          [clean substringWithRange:NSMakeRange(0, 1)],
          [clean substringWithRange:NSMakeRange(0, 1)],
          [clean substringWithRange:NSMakeRange(1, 1)],
          [clean substringWithRange:NSMakeRange(1, 1)],
          [clean substringWithRange:NSMakeRange(2, 1)],
          [clean substringWithRange:NSMakeRange(2, 1)]
        ];
    }

    if ([clean length] == 6) {
      clean = [clean stringByAppendingString:@"ff"];
    }

    unsigned int base;
    [[NSScanner scannerWithString:clean] scanHexInt:&base];

    float red   = ((base >> 24) & 0xFF) / 255.0f;
    float green = ((base >> 16) & 0xFF) / 255.0f;
    float blue  = ((base >> 8)  & 0xFF) / 255.0f;
    float alpha = ((base >> 0)  & 0xFF) / 255.0f;

    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

%hook DCDThemeColor
  + (id)HEADER_PRIMARY {
    return color(@"#FBFBFB");
  }

  + (id)HEADER_SECONDARY {
    return color(@"#B6B6B6");
  }

  + (id)TEXT_NORMAL {
    return color(@"#FBFBFB");
  }

  + (id)TEXT_MUTED {
    return color(@"#B6B6B6");
  }

  + (id)INTERACTIVE_NORMAL {
    return color(@"#C8C8C8");
  }

  + (id)INTERACTIVE_HOVER {
    return color(@"#DCDDDE");
  }

  + (id)INTERACTIVE_ACTIVE {
    return color(@"#FFFFFF");
  }

  + (id)INTERACTIVE_MUTED {
    return color(@"#747474");
  }

  + (id)BACKGROUND_PRIMARY {
    return color(@"#000000");
  }

  + (id)BACKGROUND_SECONDARY {
    return color(@"#000000");
  }

  + (id)BACKGROUND_SECONDARY_ALT {
    return color(@"#000000");
  }

  + (id)BACKGROUND_TERTIARY {
    return color(@"#000000");
  }

  + (id)BACKGROUND_ACCENT {
    return color(@"#000000");
  }

  + (id)BACKGROUND_FLOATING {
    return color(@"#000000");
  }

  + (id)BACKGROUND_NESTED_FLOATING {
    return color(@"#000000");
  }

  + (id)BACKGROUND_MESSAGE_HOVER {
    return color(@"#ffffff05");
  }

  + (id)BACKGROUND_MODIFIER_HOVER {
    return color(@"#ffffff05");
  }

  + (id)BACKGROUND_MODIFIER_ACTIVE {
    return color(@"#ffffff08");
  }

  + (id)BACKGROUND_MODIFIER_SELECTED {
    return color(@"#ffffff0a");
  }

  + (id)BACKGROUND_MODIFIER_ACCENT {
    return color(@"#ffffff0f");
  }

  + (id)SCROLLBAR_THIN_THUMB {
    return color(@"#292929");
  }

  + (id)SCROLLBAR_THIN_TRACK {
    return [UIColor clearColor];
  }

  + (id)SCROLLBAR_AUTO_THUMB {
    return color(@"#292929");
  }

  + (id)SCROLLBAR_AUTO_TRACK {
    return color(@"#0000001a");
  }

  + (id)CHANNELTEXTAREA_BACKGROUND {
    return [UIColor clearColor];
  }

  + (id)CHANNELS_DEFAULT {
    return color(@"#B6B6B6");
  }
%end

@interface DCDChat : UIView
@end

%hook DCDChat
  - (void)didMoveToWindow {
    %orig();

    [self setBackgroundColor:[UIColor blackColor]];
  }
%end

%hook RCTCxxBridge
  - (void)executeApplicationScript:(NSData *)script url:(NSURL *)url async:(BOOL)async {
    NSString *payload = NSStringMultiline(
      const oObjectFreeze = this.Object.freeze;

      Object.freeze = function (obj, ...args) {
        if (!obj?.hasOwnProperty) {
          return oObjectFreeze.call(this, obj, ...args);
        }

        try {
          if (obj.hasOwnProperty?.('BACKGROUND_PRIMARY')) {
            return oObjectFreeze.call(this, Object.assign(obj, {
              HEADER_PRIMARY: [
                '#FBFBFB',
                '#FFFFFF'
              ],
              HEADER_SECONDARY: [
                '#B6B6B6',
                '#FFFFFF'
              ],
              TEXT_NORMAL: [
                '#FBFBFB',
                '#FFFFFF'
              ],
              TEXT_MUTED: [
                '#B6B6B6',
                '#FFFFFF'
              ],
              INTERACTIVE_NORMAL: [
                '#C8C8C8',
                '#FFFFFF'
              ],
              INTERACTIVE_HOVER: [
                '#DCDDDE',
                '#FFFFFF'
              ],
              INTERACTIVE_ACTIVE: [
                '#FFFFFF',
                '#FFFFFF'
              ],
              INTERACTIVE_MUTED: [
                '#747474',
                '#FFFFFF'
              ],
              BACKGROUND_PRIMARY: [
                '#000000',
                '#FFFFFF'
              ],
              BACKGROUND_SECONDARY: [
                '#000000',
                '#FFFFFF'
              ],
              BACKGROUND_SECONDARY_ALT: [
                '#000000',
                '#FFFFFF'
              ],
              BACKGROUND_TERTIARY: [
                '#000000',
                '#FFFFFF'
              ],
              BACKGROUND_ACCENT: [
                '#000000',
                '#FFFFFF'
              ],
              BACKGROUND_FLOATING: [
                '#000000',
                '#FFFFFF'
              ],
              BACKGROUND_MOBILE_PRIMARY: [
                '#000000',
                '#FFFFFF'
              ],
              BACKGROUND_MOBILE_SECONDARY: [
                '#000000',
                '#FFFFFF'
              ],
              BACKGROUND_NESTED_FLOATING: [
                '#000000',
                '#FFFFFF'
              ],
              BACKGROUND_MESSAGE_HOVER: [
                'rgba(255, 255, 255, 0.02)',
                '#FFFFFF'
              ],
              BACKGROUND_MODIFIER_HOVER: [
                'rgba(255, 255, 255, 0.02)',
                '#FFFFFF'
              ],
              BACKGROUND_MODIFIER_ACTIVE: [
                'rgba(255, 255, 255, 0.03)',
                '#FFFFFF'
              ],
              BACKGROUND_MODIFIER_SELECTED: [
                'rgba(255, 255, 255, 0.04)',
                '#FFFFFF'
              ],
              BACKGROUND_MODIFIER_ACCENT: [
                'rgba(255, 255, 255, 0.06)',
                '#FFFFFF'
              ],
              SCROLLBAR_THIN_THUMB: [
                '#292929',
                '#FFFFFF'
              ],
              SCROLLBAR_THIN_TRACK: [
                'transparent',
                '#FFFFFF'
              ],
              SCROLLBAR_AUTO_THUMB: [
                '#292929',
                '#FFFFFF'
              ],
              SCROLLBAR_AUTO_TRACK: [
                'rgba(0, 0, 0, 0.1)',
                '#FFFFFF'
              ],
              CHANNELTEXTAREA_BACKGROUND: [
                'transparent',
                '#FFFFFF'
              ],
              CHANNELS_DEFAULT: [
                '#B6B6B6',
                '#FFFFFF'
              ]
            }), ...args);
          }

          if (obj.hasOwnProperty?.('PRIMARY_DARK')) {
            return oObjectFreeze.call(this, Object.assign(obj, {
              PRIMARY_DARK: '#000000',
              PRIMARY_DARK_100: '#ffffff',
              PRIMARY_DARK_200: '#ffffff',
              PRIMARY_DARK_300: '#B6B6B6',
              PRIMARY_DARK_360: '#C8C8C8',
              PRIMARY_DARK_400: '#C8C8C8',
              PRIMARY_DARK_500: '#0c0c0c',
              PRIMARY_DARK_600: '#000000',
              PRIMARY_DARK_630: '#1f1f1f',
              PRIMARY_DARK_700: '#000000',
              PRIMARY_DARK_800: '#000000',
              PRIMARY_DARK_900: '#000000'
            }), ...args);
          }

          if (obj.hasOwnProperty?.('CHAT_GREY')) {
            return oObjectFreeze.call(this, Object.assign(obj, {
              CHAT_GREY: '#000000'
            }), ...args);
          }
        } catch (e) {
          console.log(e);
        }

        return oObjectFreeze.apply(this, [obj, ...args]);
      };
    );

    NSData *data = [payload dataUsingEncoding:NSUTF8StringEncoding];

    %orig(data, url, NO);
    %orig(script, url, async);
  }
%end