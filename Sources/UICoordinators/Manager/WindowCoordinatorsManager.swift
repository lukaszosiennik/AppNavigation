//
//  Created by Łukasz Osiennik on 07/05/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

public final class WindowCoordinatorsManager {
    
    let registry = WindowCreatorRegistry()
    
    private let coordinatorFactory = WindowCoordinatorFactory()
    
    private var coordinatorsData: [UUWindowID: WindowCoordinatorData] = [:]
    private var keyCoordinatorData: WindowCoordinatorData?
    
    public init() {}
    
    public func load(_ windowType: WindowType) throws {
        try load(windowID: try registry.firstWindowID(for: windowType))
    }
    
    public func load(windowID: UUWindowID) throws {
        guard windowID != keyCoordinatorData?.windowID else {
            throw WindowCoordinatorsManagerError.cannotLoadKeyWindowID
        }
        
        let windowCreator = try registry.windowCreator(with: windowID)
        
        if windowCreator.windowType == .dev {
            guard registry.isRegistered(windowType: .app) else {
                throw WindowCoordinatorsManagerError.cannotLoadDevWindowIDIfAppWindowIDIsNotRegistered
            }
        }
        
        let coordinatorData = coordinatorsData[windowID] ?? coordinatorFactory.create(windowID: windowID, windowCreator: windowCreator)
        coordinatorsData[windowID] = coordinatorData
        
        changeKeyCoordinator(using: coordinatorData)
        
        coordinatorData.coordinator.display()
    }
    
    func unload(windowID: UUWindowID) throws {
        guard windowID != keyCoordinatorData?.windowID else {
            throw WindowCoordinatorsManagerError.cannotUnloadKeyWindowID
        }
        
        // TODO: WindowCreatorRegistryError.notRegisteredWindowID
        
        guard let index = coordinatorsData.index(forKey: windowID) else {
            throw WindowCoordinatorsManagerError.cannotUnloadNotLoadedWindowID
        }
        
        guard (try? registry.windowCreator(with: windowID))?.windowType != .app else {
            throw WindowCoordinatorsManagerError.cannotUnloadAppWindowID
        }
        
        coordinatorsData.remove(at: index)
    }
    
    private func changeKeyCoordinator(using newKeyCoordinatorData: WindowCoordinatorData) {
        coordinatorWindowContent(from: keyCoordinatorData)?.delegate = nil
        coordinatorWindowContent(from: newKeyCoordinatorData)?.delegate = self
        
        keyCoordinatorData = newKeyCoordinatorData
    }
}

extension WindowCoordinatorsManager {
    
    private func coordinatorWindowContent(from coordinatorData: WindowCoordinatorData?) -> CoordinatorWindowContent? {
        return coordinatorData?.coordinator.content as? CoordinatorWindowContent
    }
}

extension WindowCoordinatorsManager: CoordinatorWindowContentDelegate {
    
    public func switchWindowActionInvoked(on windowID: UUWindowID) {
        #if DEBUG
        guard let windowType = (try? registry.windowCreator(with: windowID))?.windowType else {
            return
        }
        
        switch windowType {
        case .app:
            try? load(.dev)
        case .dev:
            try? load(.app)
        }
        #endif
    }
}
