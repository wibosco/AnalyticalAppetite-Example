//
//  AnalyticsManager.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 30/09/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation
import Mixpanel

protocol AnalyticsEventSending {
    func send(_ event: AnalyticsEvent)
}

class AnalyticsService: AnalyticsEventSending {
    private let mixpanel: Mixpanel
    
    // MARK: - Init
    
    init(mixpanel: Mixpanel) {
        self.mixpanel = mixpanel
    }
    
    // MARK: - Send

    func send(_ event: AnalyticsEvent) {
        mixpanel.track(event.name,
                       properties: event.properties)
    }
}
