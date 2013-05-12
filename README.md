gamekit_helper
==============

Integrate with Game Center made easy.




##Generate instance of it.

GameKitHelper *gk = [GameKitHelper sharedGameKitHelper];

##At the beginning, try to Auth.

// try to auth.
[gk authenticateLocalPlayer];

// show leader board by your category id. ex.(@"com.nobinobiru.app");

[gk showLeaderboard:@"com.nobinobiru.app"];

// submit score to game center.
[gk submitScore:33 category:@"com.nobinobiru.app"];





  
