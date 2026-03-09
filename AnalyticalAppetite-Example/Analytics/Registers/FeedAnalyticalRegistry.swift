//
//  FeedAnalyticRegistry.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 30/09/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class FeedAnalyticalRegistry {
    private let service: AnalyticsEventSending
    
    // MARK: - Init
    
    init(service: AnalyticsEventSending) {
        self.service = service
    }
    
    // MARK: - Events
    
    func sendPostOpenedEvent() {
        let event = AnalyticsEvent(name: "Post Opened")
        
        service.send(event)
    }
    
    func sendLikeEvent(liked: Bool) {
        let event = AnalyticsEvent(name: "Post Liked",
                                   properties: ["Liked": liked])
        
        service.send(event)
    }
    
    func sendSharedEvent(shared: Bool) {
        let event = AnalyticsEvent(name: "Post Shared",
                                   properties: ["Shared": shared])
        
        service.send(event)
    }
}
