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

    // MARK: Properties
    
    let mixpanel = Mixpanel.sharedInstance()
    
    let feedAnalyticalRegistry: FeedAnalyticalRegistry
    let profileAnalyticalRegistry: ProfileAnalyticalRegistry
    
    // MARK: Init
    
    init(feedAnalyticalRegistry: FeedAnalyticalRegistry = FeedAnalyticalRegistry.sharedInstance, profileAnalyticalRegistry: ProfileAnalyticalRegistry = ProfileAnalyticalRegistry.sharedInstance) {
        self.profileAnalyticalRegistry = profileAnalyticalRegistry
        self.feedAnalyticalRegistry = feedAnalyticalRegistry
        super.init()
        feedAnalyticalRegistry.delegate = self
        profileAnalyticalRegistry.delegate = self
    }
    
    // MARK: Singleton
    
    static let sharedInstance = AnalyticsManager()
    
    // MARK: AnalyticsDelegate
    
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
