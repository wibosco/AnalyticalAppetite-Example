//
//  ProfileAnalyticalRegistryTests.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 02/10/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class ProfileAnalyticalRegistryTests: XCTestCase {
    var delegate: StubAnalyticsDelegate!
    var sut: ProfileAnalyticalRegistry!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        
        delegate = StubAnalyticsDelegate()
        sut = ProfileAnalyticalRegistry(delegate: delegate)
    }
    
    
    // MARK: - Tests
    
    func test_whenSendAvatarChangedEvent_thenEventDetaiAreCorrect() {
        sut.sendAvatarChangedEvent()
        
        XCTAssertEqual(delegate.events.count, 1)
        
        guard case let .sendEvent(eventName, properties) = delegate.events[0] else {
            XCTFail("Expected sendEvent")
            return
        }
        
        XCTAssertEqual(sut.avatarChangedEventName, eventName)
        XCTAssertNil(properties)
    }

    func test_whenSendFieldsChangedEvent_thenEventDetaiAreCorrect() {
        let firstnameChanged = true
        let lastnameChanged = true
        let emailAddressChanged = false
        let bioChanged = true
        
        sut.sendFieldsChangedEvent(firstNameChanged: firstnameChanged,
                                   lastNameChanged: lastnameChanged,
                                   emailAddressChanged: emailAddressChanged,
                                   bioChanged: bioChanged)
        
        XCTAssertEqual(delegate.events.count, 1)
        
        guard case let .sendEvent(eventName, properties) = delegate.events[0] else {
            XCTFail("Expected sendEvent with properties")
            return
        }
        
        XCTAssertEqual(sut.profileFieldsEventName, eventName)
        
        XCTAssertEqual(firstnameChanged, properties?[sut.fieldsFirstNameChangedPropertyName] as? Bool)
        XCTAssertEqual(lastnameChanged, properties?[sut.fieldsLastNameChangedPropertyName] as? Bool)
        XCTAssertEqual(emailAddressChanged, properties?[sut.fieldsEmailAddressChangedPropertyName] as? Bool)
        XCTAssertEqual(bioChanged, properties?[sut.fieldsBioChangedPropertyName] as? Bool)
        XCTAssertEqual(3, properties?[sut.fieldsTotalChangedPropertyName] as? Int)
    }
    
    func test_whenSendFriendRequest_thenEventDetaiAreCorrect() {
        let requested = true
        
        sut.sendFriendRequestEvent(requested: requested)
        
        XCTAssertEqual(delegate.events.count, 1)
        
        guard case let .sendEvent(eventName, properties) = delegate.events[0] else {
            XCTFail("Expected sendEvent with properties")
            return
        }
        
        XCTAssertEqual(sut.friendRequestEventName, eventName)
        XCTAssertEqual(requested, properties?[sut.friendRequestedPropertyName] as? Bool)
    }    
}
