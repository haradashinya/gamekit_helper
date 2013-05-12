#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>

@protocol GameKitHelperProtocol<NSObject>
@end

@interface GameKitHelper : NSObject
@property(nonatomic,assign) id<GameKitHelperProtocol> delegate;
@property (nonatomic, readonly) NSError* lastError;

+ (id) sharedGameKitHelper;
-(void) authenticateLocalPlayer;
-(void)submitScore:(int)value category:(NSString *)category;
- (void) showLeaderboard: (NSString*) leaderboardID;





@end
