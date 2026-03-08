//
//  FeedAnalyticalRegistryTests.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 02/10/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class FeedAnalyticalRegistryTests: XCTestCase {
    var delegate: StubAnalyticsDelegate!
    var sut: FeedAnalyticalRegistry!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        
        delegate = StubAnalyticsDelegate()
        sut = FeedAnalyticalRegistry(delegate: delegate)
    }
    
    // MARK: - Tests
    
    func test_whenSendPostOpenedEventIsCalled_thenEventDetaiAreCorrect() {
        sut.sendPostOpenedEvent()
        
        XCTAssertEqual(1, delegate.events.count)
        
        guard case let .sendEvent(eventName, properties) = delegate.events[0] else {
            XCTFail("Expected sendEvent with properties")
            return
        }
        
        XCTAssertEqual(eventName, sut.postOpenedEventName)
        XCTAssertNil(properties)
    }
    
    func test_whenSendLikeEventIsCalled_thenEventDetaiAreCorrect() {
        let liked = true
        
        sut.sendLikeEvent(liked: liked)
        
        XCTAssertEqual(1, delegate.events.count)
        
        guard case let .sendEvent(eventName, properties) = delegate.events[0] else {
            XCTFail("Expected sendEvent with properties")
            return
        }
        
        XCTAssertEqual(sut.postLikeEventName, eventName)
        XCTAssertEqual(properties?[sut.postLikePropertyName] as? Bool, liked)
    }

    func test_whenSendSharedEventIsCalled_thenEventDetaiAreCorrect() {
        let shared = true
        
        sut.sendSharedEvent(shared: shared)
        
        XCTAssertEqual(1, delegate.events.count)
        
        guard case let .sendEvent(eventName, properties) = delegate.events[0] else {
            XCTFail("Expected sendEvent with properties")
            return
        }
        
        XCTAssertEqual(eventName, sut.postSharedEventName)
        XCTAssertEqual(properties?[sut.postSharedPropertyName] as? Bool, shared)
    }
    
    func test_whenStartedScrollingFeedEvent_thenEventDetaiAreCorrect() {
        sut.startedScrollingFeedEvent()
        
        XCTAssertEqual(1, delegate.events.count)
        
        guard case let .startTimedEvent(eventName) = delegate.events[0] else {
            XCTFail("Expected startTimedEvent")
            return
        }
        
        XCTAssertEqual(eventName, sut.feedScrolledEventName)
    }
    
    func test_whenSendScrolledFeedEvent_thenEventDetaiAreCorrect() {
        sut.sendScrolledFeedEvent()
        
        XCTAssertEqual(1, delegate.events.count)
        
        guard case let .sendEvent(eventName, properties) = delegate.events[0] else {
            XCTFail("Expected sendEvent without properties")
            return
        }
        
        XCTAssertEqual(eventName, sut.feedScrolledEventName)
        XCTAssertNil(properties)
    }
}
