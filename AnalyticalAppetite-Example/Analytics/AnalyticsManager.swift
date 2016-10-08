//
//  AnalyticsManager.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 30/09/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation
import Mixpanel

protocol AnalyticsDelegate: class {
    func sendEvent(name: String)
    func sendEvent(name: String, properties: [String: AnyObject]?)
    func startTimedEvent(name: String)
}

class AnalyticsManager: NSObject, AnalyticsDelegate {

    // MARK: - Properties
    
    let mixpanel = Mixpanel.sharedInstanceWithToken("32011ca4a547c7bba1278c903409d0e1")
    
    lazy var feedAnalyticalRegistry: FeedAnalyticalRegistry = {
        let feedAnalyticalRegistry = FeedAnalyticalRegistry(delegate: self)
        
        return feedAnalyticalRegistry
    }()
    
    lazy var profileAnalyticalRegistry: ProfileAnalyticalRegistry = {
        let profileAnalyticalRegistry = ProfileAnalyticalRegistry(delegate: self)
        
        return profileAnalyticalRegistry
    }()
    
    lazy var settingsAnalyticalRegistry: SettingsAnalyticalRegistry = {
        let settingsAnalyticalRegistry = SettingsAnalyticalRegistry(delegate: self)
        
        return settingsAnalyticalRegistry
    }()
    
    // MARK: - Singleton
    
    static let sharedInstance = AnalyticsManager()
    
    // MARK: - AnalyticsDelegate
    
    func sendEvent(name: String) {
        sendEvent(name, properties: nil)
    }
    
    func sendEvent(name: String, properties: [String: AnyObject]?) {
        mixpanel.track(name, properties: properties)
    }
    
    func startTimedEvent(name: String) {
        mixpanel.timeEvent(name)
    }
}
