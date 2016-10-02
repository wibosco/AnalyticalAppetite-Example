//
//  FeedAnalyticRegistry.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 30/09/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class FeedAnalyticalRegistry: NSObject {
    
    // MARK: Events
    
    let postOpenedEventName = "Post Opened"
    let postLikeEventName = "Post Liked"
    let postSharedEventName = "Post Shared"
    let feedScrolledEventName = "Feed Scrolled"
    
    // MARK: Parameters
    
    let postLikePropertyName = "Liked"
    let postSharedPropertyName = "Shared"
    
    // MARK: Singleton
    
    static let sharedInstance = FeedAnalyticalRegistry()
    
    // MARK: Properties
    
    var delegate: AnalyticsDelegate?
    
    // MARK: Post
    
    func sendPostOpenedEvent() {
        delegate?.sendEvent(postOpenedEventName, properties: nil)
    }
    
    func sendLikeEvent(like: Bool) {
        let properties = [postLikePropertyName: like]
        
        delegate?.sendEvent(postLikeEventName, properties: properties)
    }
    
    func sendSharedEvent(shared: Bool) {
        let properties = [postSharedPropertyName: shared]
        
        delegate?.sendEvent(postSharedEventName, properties: properties)
    }
    
    // MARK: Scrolling
    
    func startedScrollingFeedEvent() {
        delegate?.startTimedEvent(feedScrolledEventName)
    }
    
    func sendScrolledFeedEvent() {
        delegate?.sendEvent(feedScrolledEventName)
    }
}
