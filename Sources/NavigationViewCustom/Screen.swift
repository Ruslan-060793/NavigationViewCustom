//
//  File.swift
//  
//
//  Created by Ruslan Pavlov on 2/12/24.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
struct Screen {
    let id: String
    let screenView: AnyView

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
