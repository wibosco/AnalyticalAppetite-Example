//
//  SettingsAnalyticalRegistryTests.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 02/10/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class SettingsAnalyticalRegistryTests: XCTestCase {
    var delegate: StubAnalyticsDelegate!
    var sut: SettingsAnalyticalRegistry!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        
        delegate = StubAnalyticsDelegate()
        sut = SettingsAnalyticalRegistry(delegate: delegate)
    }
    
    // MARK: - Tests
    
    func test_whenSendNotificationEnabled_thenEventDetaiAreCorrect() {
        let enabled = true
        
        sut.sendNotificationEnabledEvent(enabled: enabled)
        
        XCTAssertEqual(delegate.events.count, 1)
        
        guard case let .sendEvent(eventName, properties) = delegate.events[0] else {
            XCTFail("Expected sendEvent with properties")
            return
        }
        
        XCTAssertEqual(sut.notificationsEventName, eventName)
        XCTAssertEqual(enabled, properties?[sut.notificationsEnabledPropertyName] as? Bool)
    }
}
