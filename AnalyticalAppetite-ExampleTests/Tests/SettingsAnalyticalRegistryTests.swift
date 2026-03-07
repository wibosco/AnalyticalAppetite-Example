//
//  SettingsAnalyticalRegistryTests.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 02/10/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class SettingsAnalyticalRegistryTests: XCTestCase {
    
    // MARK: - Properties
    
    var analyticsDelegateSpy: AnalyticsDelegateSpy!
    var settingsAnalyticalRegistry: SettingsAnalyticalRegistry!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        
        analyticsDelegateSpy = AnalyticsDelegateSpy()
        settingsAnalyticalRegistry = SettingsAnalyticalRegistry(delegate: analyticsDelegateSpy)
    }
    
    // MARK: - Tests
    
    // MARK: sendNotificationEnabled
    
    func test_sendNotificationEnabled_eventName() {
        settingsAnalyticalRegistry.sendNotificationEnabled(enabled: true)
        
        XCTAssertEqual(settingsAnalyticalRegistry.notificationsEventName, analyticsDelegateSpy.passedInEventName)
    }
    
    func test_sendNotificationEnabled_properties() {
        let enabled = true
        
        settingsAnalyticalRegistry.sendNotificationEnabled(enabled: enabled)
        
        XCTAssertEqual(enabled, analyticsDelegateSpy.passedInProperties![settingsAnalyticalRegistry.notificationsEnabledPropertyName] as? Bool)
    }
    
}
