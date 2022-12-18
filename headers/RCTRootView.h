@class RCTBridge;

@interface RCTRootView : UIView {
  RCTBridge *_bridge;
}

@property(readonly, nonatomic) RCTBridge *bridge; // @synthesize bridge=_bridge;

@end