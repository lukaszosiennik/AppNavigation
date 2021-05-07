//
//  Created by Łukasz Osiennik on 07/05/2020.
//  Copyright © 2020 Łukasz Osiennik. All rights reserved.
//

enum RootCoordinatorControllerError: Error {
    
    case appWindowIDAlreadyRegistered
    case cannotLoadRegisteredDevWindowIDIfAppWindowIDIsNotRegistered
    case cannotLoadNotRegisteredWindowID
    case cannotUnregisterNotRegisteredWindowID
    case nothingToUnregister
}

typealias WindowIDRegistryElement = (registeredWindowID: RegisteredWindowID, windowID: WindowID)

final class RootCoordinatorController {
    
    private var windowIDRegistry: [RegisteredWindowID: WindowID] = [:]
    
    private let coordinatorCache = RootCoordinatorCache()
    
    private var currentRootCoordinator: Coordinator?
    
    func register(windowID: WindowID) throws -> RegisteredWindowID {
        if windowID.isApp {
            guard !isRegisteredWindowID(.app) else {
                throw RootCoordinatorControllerError.appWindowIDAlreadyRegistered
            }
        }
        
        let registeredWindowID = RegisteredWindowID()
        windowIDRegistry[registeredWindowID] = windowID
        
        return registeredWindowID
    }
    
    func loadApp() throws {
        guard let appWindowIDRegistry = windowIDRegistryEntry(.app) else {
            throw RootCoordinatorControllerError.cannotLoadNotRegisteredWindowID
        }
        
        try load(registeredWindowID: appWindowIDRegistry.key)
    }
    
    func load(registeredWindowID: RegisteredWindowID) throws {
        guard let windowID = windowIDRegistry[registeredWindowID] else {
            throw RootCoordinatorControllerError.cannotLoadNotRegisteredWindowID
        }
        
        if windowID.isDev {
            guard isRegisteredWindowID(.app) else {
                throw RootCoordinatorControllerError.cannotLoadRegisteredDevWindowIDIfAppWindowIDIsNotRegistered
            }
        }
        
        let coordinator = coordinatorCache.provideWith(windowIDRegistryElement: WindowIDRegistryElement(registeredWindowID: registeredWindowID, windowID: windowID))
        
        switchCurrentRootCoordinator(with: coordinator)
        
        coordinator.display()
    }
    
    func unregister(registeredWindowID: RegisteredWindowID) throws {
        guard let registryIndex = windowIDRegistry.index(forKey: registeredWindowID) else {
            throw RootCoordinatorControllerError.cannotUnregisterNotRegisteredWindowID
        }
        
        windowIDRegistry.remove(at: registryIndex)
    }
    
    func unregisterAll() throws {
        guard !windowIDRegistry.isEmpty else {
            throw RootCoordinatorControllerError.nothingToUnregister
        }
        
        windowIDRegistry.removeAll()
    }
    
    private func loadFirstDev() throws {
        guard let devWindowIDRegistryEntry = windowIDRegistryEntry(.dev) else {
            throw RootCoordinatorControllerError.cannotLoadNotRegisteredWindowID
        }
        
        try? load(registeredWindowID: devWindowIDRegistryEntry.key)
    }
    
    private func isRegisteredWindowID(_ windowIDType: WindowIDType) -> Bool {
        return windowIDRegistryEntry(windowIDType) != nil
    }
    
    private func windowIDRegistryEntry(_ windowIDType: WindowIDType) -> (key: RegisteredWindowID, value: WindowID)? {
        return windowIDRegistry.first {
            $0.value.is(windowIDType)
        }
    }
    
    private func switchCurrentRootCoordinator(with newRootCoordinator: Coordinator) {
        (currentRootCoordinator?.content as? CoordinatorWindowContent)?.delegate = nil
        (newRootCoordinator.content as? CoordinatorWindowContent)?.delegate = self
        
        currentRootCoordinator = newRootCoordinator
    }
}

extension RootCoordinatorController: CoordinatorWindowContentDelegate {
    
    func switchWindowActionInvoked(on registeredWindowID: RegisteredWindowID) {
        #if DEBUG
        guard let windowID = windowIDRegistry[registeredWindowID] else {
            return
        }
        
        switch windowID {
        case .app:
            try? loadFirstDev()
        case .dev:
            try? loadApp()
        }
        #endif
    }
}
