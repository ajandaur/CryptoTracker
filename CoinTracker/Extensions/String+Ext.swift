//
//  String+Ext.swift
//  CoinTracker
//
//  Created by Anmol  Jandaur on 7/4/22.
//

import Foundation

extension String {
    
    var removeHTMLOccurences: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
