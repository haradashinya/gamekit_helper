
#import "GameKitHelper.h"

@interface GameKitHelper ()
<GKGameCenterControllerDelegate> {
   __block BOOL isEnabled;
}
@end

@implementation GameKitHelper

#pragma mark Singleton stuff

+(id) sharedGameKitHelper {
    static GameKitHelper *sharedGameKitHelper;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedGameKitHelper =
        [[GameKitHelper alloc] init];
    });
    return sharedGameKitHelper;
}

-(UIViewController *)rootVC
{
    return [[UIApplication sharedApplication].keyWindow rootViewController];
}
#pragma mark Player Authentication

-(void) authenticateLocalPlayer {
    
    GKLocalPlayer* localPlayer =
    [GKLocalPlayer localPlayer];
    [localPlayer setAuthenticateHandler:^(UIViewController *vc, NSError *err) {
        if (!err && [GKLocalPlayer localPlayer].isAuthenticated){
            isEnabled = YES;
        }
    }];
}
- (void) showLeaderboard: (NSString*) leaderboardID
{
    GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
    if (gameCenterController != nil && isEnabled)
    {
        gameCenterController.gameCenterDelegate = self;
        gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
        gameCenterController.leaderboardTimeScope = GKLeaderboardTimeScopeToday;
        gameCenterController.leaderboardCategory = leaderboardID;
        [[[UIApplication sharedApplication].keyWindow rootViewController] presentViewController:gameCenterController animated:YES completion:nil];
    }
}

-(void) setLastError:(NSError*)error {
    _lastError = [error copy];
    if (_lastError) {
        NSLog(@"GameKitHelper ERROR: %@", [[_lastError userInfo]
                                           description]);
    }
}
-(void)submitScore:(int)value category:(NSString *)category
{
    if (isEnabled){
        
    GKScore *gkScore = [[GKScore alloc] initWithCategory:category];
    gkScore.value = value;
//    [gkScore setCategory:@"com.nobinobiru.anzan.score"];
    
    [gkScore reportScoreWithCompletionHandler:^(NSError *error) {
        [self setLastError:error];
    }];
        
    }
    
}
-(void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController
{
    
    [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:nil];
}




@end
