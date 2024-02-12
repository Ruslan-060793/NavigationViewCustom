//
//  File.swift
//  
//
//  Created by Ruslan Pavlov on 2/12/24.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
enum AnimationType {
    case none
    case custom(AnyTransition, AnyTransition)
}

