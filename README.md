gamekit_helper
==============

Integrate with Game Center made easy.




###Generate instance of it.

  <pre>GameKitHelper *gk = [GameKitHelper sharedGameKitHelper];</pre>

###At the beginning, try to Auth.


  <pre>[gk authenticateLocalPlayer];</pre>

###Show leader board by your category id. ex.(@"com.nobinobiru.app");

[gk showLeaderboard:@"com.nobinobiru.app"];

###Submit score to game center.
[gk submitScore:33 category:@"com.nobinobiru.app"];





  
