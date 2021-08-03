//
//  Created by Łukasz Osiennik on 07/05/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

public final class RootCoordinatorsManager<DevRootWindowType> where DevRootWindowType: DevRootWindowTypeInterface {
    
    public let windowCreatorRegistry = WindowCreatorRegistry<DevRootWindowType>()
    
    private var rootCoordinatorsSet = Set<RootCoordinator<DevRootWindowType>>()
    private var keyRootCoordinator: RootCoordinator<DevRootWindowType>?
    
    public init() {}
    
    public func load(_ windowType: WindowType<DevRootWindowType>) throws {
        guard windowType != keyRootCoordinator?.entity.windowType else {
            throw RootCoordinatorsManagerError.cannotLoadKeyWindowType
        }
        
        if windowType.isDev {
            guard windowCreatorRegistry.isRegistered(windowType: .app) else {
                throw RootCoordinatorsManagerError.cannotLoadDevWindowTypeIfAppWindowTypeIsNotRegistered
            }
        }
        
        let currentRootCoordinator: RootCoordinator<DevRootWindowType>
        if let coordinator = try? rootCoordinator(for: windowType) {
            currentRootCoordinator = coordinator
        } else {
            guard let windowCreator = try? windowCreatorRegistry.windowCreator(for: windowType) else {
                throw RootCoordinatorsManagerError.cannotLoadNotRegisteredWindowType
            }
            
            currentRootCoordinator = RootCoordinatorFactory.create(windowCreator: windowCreator)
            
            rootCoordinatorsSet.insert(currentRootCoordinator)
        }
        
        changeKeyRootCoordinator(using: currentRootCoordinator)
        
        currentRootCoordinator.coordinator.display()
    }
    
    public func unload(_ windowType: WindowType<DevRootWindowType>) throws {
        guard windowType != keyRootCoordinator?.entity.windowType else {
            throw RootCoordinatorsManagerError.cannotUnloadKeyWindowType
        }
        
        guard !windowType.isApp else {
            throw RootCoordinatorsManagerError.cannotUnloadAppWindowType
        }
        
        guard (try? windowCreatorRegistry.windowCreator(for: windowType)) != nil else {
            throw RootCoordinatorsManagerError.cannotUnloadNotRegisteredWindowType
        }
        
        guard let coordinator = try? rootCoordinator(for: windowType) else {
            throw RootCoordinatorsManagerError.cannotUnloadNotLoadedWindowType
        }
        
        rootCoordinatorsSet.remove(coordinator)
    }
    
    private func changeKeyRootCoordinator(using rootCoordinator: RootCoordinator<DevRootWindowType>) {
        coordinatorWindowContent(from: keyRootCoordinator)?.delegate = nil
        coordinatorWindowContent(from: rootCoordinator)?.delegate = self
        
        keyRootCoordinator = rootCoordinator
    }
}

extension RootCoordinatorsManager {
        
    func rootCoordinator(for windowType: WindowType<DevRootWindowType>) throws -> RootCoordinator<DevRootWindowType> {
        guard let coordinator = rootCoordinatorsSet.first(where: { $0.entity.windowType == windowType }) else {
            throw RootCoordinatorsManagerError.notLoadedWindowType
        }
        
        return coordinator
    }
}

extension RootCoordinatorsManager {
    
    private func coordinatorWindowContent(from rootCoordinator: RootCoordinator<DevRootWindowType>?) -> CoordinatorWindowContent? {
        return rootCoordinator?.coordinator.content as? CoordinatorWindowContent
    }
}

extension RootCoordinatorsManager: CoordinatorWindowContentDelegate {
    
    public func switchWindowActionInvoked(on windowID: UUWindowID) {
        // TODO: this code should be enabled only for DEBUG builds
//        #if DEBUG
        guard let windowType = rootCoordinatorsSet.first(where: { $0.entity.windowID == windowID })?.entity.windowType else {
            return
        }
        
        switch windowType {
        case .app:
            try? load(.dev)
        case .dev:
            try? load(.app)
        }
//        #endif
    }
}
