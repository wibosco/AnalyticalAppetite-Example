//
//  FeedAnalyticalRegistryTests.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 02/10/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import AnalyticalAppetite_Example

class FeedAnalyticalRegistryTests: XCTestCase {
    var stub: StubAnalyticsEventSending!
    var sut: FeedAnalyticalRegistry!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()

        stub = StubAnalyticsEventSending()
        sut = FeedAnalyticalRegistry(service: stub)
    }

    // MARK: - Tests

    func test_whenSendPostOpenedEventIsCalled_thenEventDetailsAreCorrect() {
        sut.sendPostOpenedEvent()

        guard case let .send(event) = stub.events.first else {
            XCTFail("Expected send event")
            return
        }

        XCTAssertEqual(event.name, "Post Opened")
        XCTAssertTrue(event.properties.isEmpty)
    }

    func test_whenSendLikeEventIsCalled_thenEventDetailsAreCorrect() {
        let liked = true

        sut.sendLikeEvent(liked: liked)

        guard case let .send(event) = stub.events.first else {
            XCTFail("Expected send event")
            return
        }

        XCTAssertEqual(event.name, "Post Liked")
        XCTAssertEqual(event.properties["Liked"] as? Bool, liked)
    }

    func test_whenSendSharedEventIsCalled_thenEventDetailsAreCorrect() {
        let shared = true

        sut.sendSharedEvent(shared: shared)

        guard case let .send(event) = stub.events.first else {
            XCTFail("Expected send event")
            return
        }

        XCTAssertEqual(event.name, "Post Shared")
        XCTAssertEqual(event.properties["Shared"] as? Bool, shared)
    }
}
