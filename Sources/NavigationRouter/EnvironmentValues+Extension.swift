//
//  File 2.swift
//  NavigationRouter
//
//  Created by sp7 on 9/6/26.
//

import Foundation
import SwiftUI

// Environment setup
@MainActor
struct NavigationRouterKey: @MainActor EnvironmentKey {
    
    static let defaultValue = NavigationRouter()
}

@MainActor
struct SheetCoordinatorKey: @MainActor EnvironmentKey {
    static let defaultValue: SheetCoordinator = .init()
}

@MainActor
extension EnvironmentValues {
    public var navigationRouter: NavigationRouter {
        get { self[NavigationRouterKey.self] }
        set { self[NavigationRouterKey.self] = newValue }
    }
    
    public var sheetCoordinator: SheetCoordinator {
        get { self[SheetCoordinatorKey.self] }
        set { self[SheetCoordinatorKey.self] = newValue }
    }
}

extension View {
    public func injectNavigationRouter(_ router: NavigationRouter) -> some View {
        environment(\.navigationRouter, router)
    }
    
    public func injectSheetCoordinator(_ coordinator: SheetCoordinator) -> some View {
        environment(\.sheetCoordinator, coordinator)
    }
}
