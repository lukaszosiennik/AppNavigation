//
//  Created by Łukasz Osiennik on 07/05/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

public final class WindowCoordinatorsManager {
    
    let registry = WindowCreatorRegistry()
    
    private let coordinatorFactory = WindowCoordinatorFactory()
    
    private var coordinators: [UUWindowID: Coordinator] = [:]
    private var keyCoordinator: Coordinator?
    
    public init() {}
    
    public func loadApp() throws {
        try load(windowID: try registry.firstWindowID(for: .app))
    }
    
    private func loadFirstDev() throws {
        try load(windowID: try registry.firstWindowID(for: .dev))
    }
    
    public func load(windowID: UUWindowID) throws {
        let windowCreator = try registry.windowCreator(with: windowID)
        
        if windowCreator.windowType == .dev {
            guard registry.isRegistered(windowType: .app) else {
                throw WindowCoordinatorsManagerError.cannotLoadRegisteredDevWindowIDIfAppWindowIDIsNotRegistered
            }
        }
        
        let coordinator = coordinators[windowID] ?? coordinatorFactory.create(windowID: windowID, windowCreator: windowCreator)
        
        changeKeyCoordinator(to: coordinator)
        
        coordinator.display()
    }
    
    private func changeKeyCoordinator(to newKeyCoordinator: Coordinator) {
        (keyCoordinator?.content as? CoordinatorWindowContent)?.delegate = nil
        (newKeyCoordinator.content as? CoordinatorWindowContent)?.delegate = self
        
        keyCoordinator = newKeyCoordinator
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
            try? loadFirstDev()
        case .dev:
            try? loadApp()
        }
        #endif
    }
}
