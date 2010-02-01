//
//  AppController.h
//  FeedViewer
//
//  Created by Colin Wheeler on 1/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <PubSub/PubSub.h>

@interface AppController : NSObject {
	PSFeed * newsFeed;
	NSOperationQueue *rssQueue;
	NSError *feedError;
}
@property(retain) NSOperationQueue *rssQueue;
@property(retain) PSFeed *newsFeed;
@property(retain) NSError *feedError;
-(IBAction)startFeedRefresh:(id)sender;
@end
