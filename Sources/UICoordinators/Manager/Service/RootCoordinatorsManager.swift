//
//  Created by Łukasz Osiennik on 07/05/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

public final class RootCoordinatorsManager<DevSecondaryWindowType> where DevSecondaryWindowType: WindowTypeInterface {
    
    let windowCreatorRegistry = WindowCreatorRegistry<DevSecondaryWindowType>()
    
    private var rootCoordinatorsSet = Set<RootCoordinator<DevSecondaryWindowType>>()
    private var keyRootCoordinator: RootCoordinator<DevSecondaryWindowType>?
    
    public init() {}
    
    public func load(_ windowType: WindowType<DevSecondaryWindowType>) throws {
        guard windowType != keyRootCoordinator?.entity.windowType else {
            throw RootCoordinatorsManagerError.cannotLoadKeyWindowType
        }
        
        if windowType.isDev {
            guard windowCreatorRegistry.isRegistered(windowType: .app) else {
                throw RootCoordinatorsManagerError.cannotLoadDevWindowTypeIfAppWindowTypeIsNotRegistered
            }
        }
        
        let currentRootCoordinator: RootCoordinator<DevSecondaryWindowType>
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
    
    func unload(_ windowType: WindowType<DevSecondaryWindowType>) throws {
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
    
    private func changeKeyRootCoordinator(using rootCoordinator: RootCoordinator<DevSecondaryWindowType>) {
        coordinatorWindowContent(from: keyRootCoordinator)?.delegate = nil
        coordinatorWindowContent(from: rootCoordinator)?.delegate = self
        
        keyRootCoordinator = rootCoordinator
    }
}

extension RootCoordinatorsManager {
        
    func rootCoordinator(for windowType: WindowType<DevSecondaryWindowType>) throws -> RootCoordinator<DevSecondaryWindowType> {
        guard let coordinator = rootCoordinatorsSet.first(where: { $0.entity.windowType == windowType }) else {
            throw RootCoordinatorsManagerError.notLoadedWindowType
        }
        
        return coordinator
    }
}

extension RootCoordinatorsManager {
    
    private func coordinatorWindowContent(from rootCoordinator: RootCoordinator<DevSecondaryWindowType>?) -> CoordinatorWindowContent? {
        return rootCoordinator?.coordinator.content as? CoordinatorWindowContent
    }
}

extension RootCoordinatorsManager: CoordinatorWindowContentDelegate {
    
    public func switchWindowActionInvoked(on windowID: UUWindowID) {
        #if DEBUG
        guard let windowType = rootCoordinatorsSet.first(where: { $0.entity.windowID == windowID })?.entity.windowType else {
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
