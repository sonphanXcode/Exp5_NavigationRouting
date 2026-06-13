//
//  SheetCoordinator.swift
//  NavigationRouter
//
//  Created by sp7 on 9/6/26.
//

import Combine
import SwiftUI

public class SheetCoordinator: ObservableObject {
    @Published public var currentSheet: SheetAvailable?
    @Published public var currentFullScreen: FullCoverAvailable?
    
    public init() {}
    
    public func show(_ sheet: any Sheetable) {
        self.currentSheet = SheetAvailable(sheet)
    }
    
    public func dismiss() {
        currentSheet = nil
    }
    
    public func showFullScreen(_ fullscreen: any FullCoverable) {
        self.currentFullScreen = FullCoverAvailable(fullscreen)
    }
    
    public func dismissFullScreen() {
        currentFullScreen = nil
    }
}

public protocol Sheetable: Hashable {
    var destination: AnyView { get }
}

public struct SheetAvailable: Identifiable {
    public let id: UUID
    
    public var sheet: (any Sheetable)?
    
    public init(_ sheet: any Sheetable) {
        self.sheet = sheet
        self.id = UUID()
    }
    
}

public protocol FullCoverable: Hashable {
    var destination: AnyView { get }
}

/// Fullscreen cover structure
public struct FullCoverAvailable: Identifiable {
    public let id: UUID
    
    public var fullscreen: (any FullCoverable)?
    
    public init(_ fullscreen: any FullCoverable) {
        self.fullscreen = fullscreen
        self.id = UUID()
    }
}
