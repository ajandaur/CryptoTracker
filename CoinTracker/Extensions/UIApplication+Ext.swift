//
//  UIApplication+Ext.swift
//  CoinTracker
//
//  Created by Anmol  Jandaur on 6/5/22.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
