//
//  FeedAnalyticalRegistryTests.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 02/10/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class FeedAnalyticalRegistryTests: XCTestCase {
    
    // MARK: - Properties
    
    var analyticsDelegateSpy: AnalyticsDelegateSpy!
    var feedAnalyticalRegistry: FeedAnalyticalRegistry!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        analyticsDelegateSpy = AnalyticsDelegateSpy()
        feedAnalyticalRegistry = FeedAnalyticalRegistry(delegate: analyticsDelegateSpy)
    }
    
    // MARK: - Tests
    
    // MARK: sendPostOpenedEvent
    
    func test_sendPostOpenedEvent_eventName() {
        feedAnalyticalRegistry.sendPostOpenedEvent()
        
        XCTAssertEqual(feedAnalyticalRegistry.postOpenedEventName, analyticsDelegateSpy.passedInEventName)
    }
    
    // MARK: sendLikeEvent
    
    func test_sendLikeEvent_eventName() {
        feedAnalyticalRegistry.sendLikeEvent(true)
        
        XCTAssertEqual(feedAnalyticalRegistry.postLikeEventName, analyticsDelegateSpy.passedInEventName)
    }
    
    func test_sendLikeEvent_properties() {
        let liked = true
        
        feedAnalyticalRegistry.sendLikeEvent(liked)
        
        XCTAssertEqual(liked, analyticsDelegateSpy.passedInProperties![feedAnalyticalRegistry.postLikePropertyName] as? Bool)
    }
    
    // MARK: sendSharedEvent
    
    func test_sendSharedEvent_eventName() {
        feedAnalyticalRegistry.sendSharedEvent(true)
        
        XCTAssertEqual(feedAnalyticalRegistry.postSharedEventName, analyticsDelegateSpy.passedInEventName)
    }
    
    func test_sendSharedEvent_properties() {
        let shared = true
        
        feedAnalyticalRegistry.sendSharedEvent(shared)
        
        XCTAssertEqual(shared, analyticsDelegateSpy.passedInProperties![feedAnalyticalRegistry.postSharedPropertyName] as? Bool)
    }
    
    // MARK: startedScrollingFeedEvent
    
    func test_startedScrollingFeedEvent_eventName() {
        feedAnalyticalRegistry.startedScrollingFeedEvent()
        
        XCTAssertEqual(feedAnalyticalRegistry.feedScrolledEventName, analyticsDelegateSpy.passedInEventName)
    }
    
    // MARK: sendScrolledFeedEvent
    
    func test_sendScrolledFeedEvent_eventName() {
        feedAnalyticalRegistry.sendScrolledFeedEvent()
        
        XCTAssertEqual(feedAnalyticalRegistry.feedScrolledEventName, analyticsDelegateSpy.passedInEventName)
    }
}
