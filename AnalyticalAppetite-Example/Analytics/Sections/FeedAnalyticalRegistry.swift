//
//  FeedAnalyticRegistry.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 30/09/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class FeedAnalyticalRegistry: AnalyticalRegistry {
    
    // MARK: - Events
    
    let postOpenedEventName = "Post Opened"
    let postLikeEventName = "Post Liked"
    let postSharedEventName = "Post Shared"
    let feedScrolledEventName = "Feed Scrolled"
    
    // MARK: - Parameters
    
    let postLikePropertyName = "Liked"
    let postSharedPropertyName = "Shared"
    
    // MARK: - Post
    
    func sendPostOpenedEvent() {
        delegate.sendEvent(name: postOpenedEventName)
    }
    
    func sendLikeEvent(liked: Bool) {
        let properties = [postLikePropertyName: liked]
        
        delegate.sendEvent(name: postLikeEventName,
                           properties: properties)
    }
    
    func sendSharedEvent(shared: Bool) {
        let properties = [postSharedPropertyName: shared]
        
        delegate.sendEvent(name: postSharedEventName,
                           properties: properties)
    }
    
    // MARK: - Scrolling
    
    func startedScrollingFeedEvent() {
        delegate.startTimedEvent(name: feedScrolledEventName)
    }
    
    func sendScrolledFeedEvent() {
        delegate.sendEvent(name: feedScrolledEventName)
    }
}
