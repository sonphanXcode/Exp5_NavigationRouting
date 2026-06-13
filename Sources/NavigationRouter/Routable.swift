//
//  Routable.swift
//  NavigationRouter
//
//  Created by sp7 on 8/6/26.
//

import Foundation
import SwiftUI

// Define Routable to inject to NavigationRouter
public protocol Routable: Hashable {
    var destionation: AnyView { get }
}
