// The Swift Programming Language
// https://docs.swift.org/swift-book

import Combine
import SwiftUI
import Foundation

public class NavigationRouter: ObservableObject {
    
    @Published public var path = NavigationPath()
    
    public init() {}
    
    public func navigate(_ router: any Routable) {
        path.append(router)
    }
    
    public func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    public func popToRoot() {
        path = NavigationPath()
    }

}


