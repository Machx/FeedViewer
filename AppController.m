//
//  AppController.m
//  FeedViewer
//
//  Created by Colin Wheeler on 1/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"

static NSString * const kAppleRSSNewsFeed = @"http://images.apple.com/main/rss/hotnews/hotnews.rss";

@implementation AppController

@synthesize rssQueue;
@synthesize newsFeed;
@synthesize feedError;
@synthesize psNotification;

-(id)init
{
	if (self = [super init]) {
		NSURL *feedURL = [NSURL URLWithString:kAppleRSSNewsFeed];
		newsFeed = [[PSFeed alloc] initWithURL:feedURL];
		rssQueue = [[NSOperationQueue alloc] init];
		[rssQueue setName:@"com.FeedViewier.rssQueue"];
		feedError = nil;
		psNotification = nil;
	}
	return self;
}

-(void)awakeFromNib
{
	NSNotificationCenter *notifyCenter = [NSNotificationCenter defaultCenter];
	self.psNotification = [notifyCenter addObserverForName:PSFeedRefreshingNotification 
													  object:newsFeed 
													   queue:rssQueue 
												  usingBlock:^(NSNotification *arg1) {
		if ([newsFeed isRefreshing]) {
			return;
		}
		
		[[NSOperationQueue mainQueue] addOperationWithBlock:^{
			
			if (nil != feedError) {
				[NSApp presentError:feedError];
				return;
			}
			
			//inform our KVO Controllers that we now have 
			//RSS entries to display
			[self willChangeValueForKey:@"newsFeed"];
			[self didChangeValueForKey:@"newsFeed"];
		}];
	}];
}

-(IBAction)startFeedRefresh:(id)sender;
{
	[newsFeed refresh:&feedError];
}

@end
