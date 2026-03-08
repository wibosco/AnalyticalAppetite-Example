//
//  AnalyticalRegistry.swift
//  AnalyticalAppetite-Example
//
//  Created by William Boles on 02/10/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class AnalyticalRegistry {
    
    // MARK: - Properties
    
    let delegate: AnalyticsDelegate
    
    // MARK: - Init
    
    init(delegate: AnalyticsDelegate) {
        self.delegate = delegate
    }
}
