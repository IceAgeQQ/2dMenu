//
//  HelloWorldLayer.m
//  2dMenu
//
//  Created by Chao Xu on 13-8-5.
//  Copyright Chao Xu 2013年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		[CCMenuItemFont setFontName:@"Marker Felt"];
        [CCMenuItemFont setFontSize:25];
        CCMenuItemImage *item1 = [CCMenuItemImage itemWithNormalImage:@"ON1.png" selectedImage:@"OFF1.png" target:self selector:@selector(one:)];
        CCMenuItemFont *item2 =[CCMenuItemFont itemWithString:@"Two" target:self selector:@selector(two:)];
        CCMenu *menu = [CCMenu menuWithItems:item1,item2, nil];
        [menu alignItemsVertically];
        [self addChild:menu];
	}
	return self;
}
-(void)one: (id)sender{
    
}
-(void)two:(id)sender{
    
}
// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
