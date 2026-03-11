//
//  AnalyticsServiceTests.swift
//  AnalyticalAppetite-ExampleTests
//
//  Created by William Boles on 11/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import XCTest

@testable import AnalyticalAppetite_Example

final class AnalyticsServiceTests: XCTestCase {
    var mixpanel: StubMixpanelTracking!
    var sut: AnalyticsService!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()

        mixpanel = StubMixpanelTracking()
        sut = AnalyticsService(mixpanel: mixpanel)
    }
        
    // MARK: - Tests
    
    func test_givenAnEventWithNameOnly_whenSendIsCalled_thenEventDetailsPassedToMixpanel() {
        let event = AnalyticsEvent(name: "test_name")
        
        sut.send(event)
        
        XCTAssertEqual(mixpanel.events.count, 1)
        
        guard case let .track(name, properties) = mixpanel.events.first else {
            XCTFail("Expected send event")
            return
        }

        XCTAssertEqual(name, "test_name")
        XCTAssertNil(properties)
    }
    
    func test_givenAnEventWithNameAndProperties_whenSendIsCalled_thenEventDetailsPassedToMixpanel() {
        let event = AnalyticsEvent(name: "test_name", properties: ["test_key": "test_value"])
        
        sut.send(event)
        
        XCTAssertEqual(mixpanel.events.count, 1)
        
        guard case let .track(name, properties) = mixpanel.events.first else {
            XCTFail("Expected send event")
            return
        }

        XCTAssertEqual(name, "test_name")
        XCTAssertEqual(properties as? [String : String], ["test_key": "test_value"])
    }
}
