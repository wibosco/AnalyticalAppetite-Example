//
//  ProfileAnalyticalRegistryTests.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 02/10/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class ProfileAnalyticalRegistryTests: XCTestCase {
    
    // MARK: - Properties
    
    var analyticsDelegateSpy: AnalyticsDelegateSpy!
    var profileAnalyticalRegistry: ProfileAnalyticalRegistry!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        analyticsDelegateSpy = AnalyticsDelegateSpy()
        profileAnalyticalRegistry = ProfileAnalyticalRegistry(delegate: analyticsDelegateSpy)
    }
    
    
    // MARK: - Tests
    
    // MARK: sendAvatarChangedEvent
    
    func test_sendAvatarChangedEvent_eventName() {
        profileAnalyticalRegistry.sendAvatarChangedEvent()
        
        XCTAssertEqual(profileAnalyticalRegistry.avatarChangedEventName, analyticsDelegateSpy.passedInEventName)
    }
    
    // MARK: sendFieldsChangedEvent
    
    func test_sendFieldsChangedEvent_eventName() {
        profileAnalyticalRegistry.sendFieldsChangedEvent(true, lastNameChanged: true, emailAddressChanged: true, bioChanged: true)
        
        XCTAssertEqual(profileAnalyticalRegistry.profileFieldsEventName, analyticsDelegateSpy.passedInEventName)
    }
    
    func test_sendFieldsChangedEvent_properties() {
        let firstnameChanged = true
        let lastnameChanged = true
        let emailAddressChanged = false
        let bioChanged = true
        
        profileAnalyticalRegistry.sendFieldsChangedEvent(firstnameChanged, lastNameChanged: lastnameChanged, emailAddressChanged: emailAddressChanged, bioChanged: bioChanged)
        
        XCTAssertEqual(firstnameChanged, analyticsDelegateSpy.passedInProperties![profileAnalyticalRegistry.fieldsFirstNameChangedPropertyName] as? Bool)
        XCTAssertEqual(lastnameChanged, analyticsDelegateSpy.passedInProperties![profileAnalyticalRegistry.fieldsLastNameChangedPropertyName] as? Bool)
        XCTAssertEqual(emailAddressChanged, analyticsDelegateSpy.passedInProperties![profileAnalyticalRegistry.fieldsEmailAddressChangedPropertyName] as? Bool)
        XCTAssertEqual(bioChanged, analyticsDelegateSpy.passedInProperties![profileAnalyticalRegistry.fieldsBioChangedPropertyName] as? Bool)
        XCTAssertEqual(3, analyticsDelegateSpy.passedInProperties![profileAnalyticalRegistry.fieldsTotalChangedPropertyName] as? Int)
    }
    
    // MARK: sendFriendRequest
    
    func test_sendFriendRequest_eventName() {
        profileAnalyticalRegistry.sendFriendRequest(true)
        
        XCTAssertEqual(profileAnalyticalRegistry.friendRequestEventName, analyticsDelegateSpy.passedInEventName)
    }
    
    func test_sendFriendRequest_properties() {
        let requested = true
        
        profileAnalyticalRegistry.sendFriendRequest(requested)
        
        XCTAssertEqual(requested, analyticsDelegateSpy.passedInProperties![profileAnalyticalRegistry.friendRequestedPropertyName] as? Bool)
    }

}
