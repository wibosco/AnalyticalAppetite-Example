//
//  AnalyticsManager.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 30/09/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation
import Mixpanel

protocol AnalyticsDelegate: AnyObject {
    func sendEvent(name: String, properties: [String: Any]?)
    func startTimedEvent(name: String)
}

extension AnalyticsDelegate {
    func sendEvent(name: String,
                   properties: [String: Any]? = nil) {
        sendEvent(name: name,
                  properties: properties)
    }
}

class AnalyticsManager: AnalyticsDelegate {

    // MARK: - AnalyticEngines
    
    let mixpanel = Mixpanel.sharedInstance(withToken: "your_mixpanel_token") //replace with your token
    
    // MARK: - Registries 
    
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
        sendEvent(name: name,
                  properties: nil)
    }
    
    func sendEvent(name: String,
                   properties: [String: Any]?) {
        mixpanel.track(name,
                       properties: properties)
    }
    
    func startTimedEvent(name: String) {
        mixpanel.timeEvent(name)
    }
}
