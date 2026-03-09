//
//  AnalyticsEvent.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 09/03/2026.
//  Copyright © 2026 Boles. All rights reserved.
//

import Foundation

struct AnalyticsEvent {
    let name: String
    let properties: [String: Any]

    init(name: String,
         properties: [String: Any] = [:]) {
        self.name = name
        self.properties = properties
    }
}
