//
//  FeedViewerAppDelegate.h
//  FeedViewer
//
//  Created by Colin Wheeler on 1/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FeedViewerAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
