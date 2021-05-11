//
//  Created by Łukasz Osiennik on 11/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

final class WindowCreatorRegistry {
    
    private var windowCreators: [UUWindowID: WindowCreator] = [:]
    
    func register(windowCreator: WindowCreator) throws -> UUWindowID {
        if windowCreator.windowType == .app {
            guard !isRegistered(windowType: .app) else {
                throw WindowCreatorRegistryError.appWindowIDAlreadyRegistered
            }
        }
        
        let windowID = UUWindowID()
        windowCreators[windowID] = windowCreator
        
        return windowID
    }
    
    func isRegistered(windowType: WindowType) -> Bool {
        return windowCreators.first {
            $0.value.windowType == windowType
        } != nil
    }
    
    func unregister(windowID: UUWindowID) throws {
        guard let index = windowCreators.index(forKey: windowID) else {
            throw WindowCreatorRegistryError.cannotUnregisterNotRegisteredWindowID
        }
        
        windowCreators.remove(at: index)
    }
    
    func unregisterAll() throws {
        guard !windowCreators.isEmpty else {
            throw WindowCreatorRegistryError.nothingToUnregister
        }
        
        windowCreators.removeAll()
    }
}

extension WindowCreatorRegistry {
    
    func windowCreator(with windowID: UUWindowID) throws -> WindowCreator {
        guard let creator = windowCreator(with: windowID) else {
            throw WindowCreatorRegistryError.notRegisteredWindowID
        }
        
        return creator
    }
    
    private func windowCreator(with windowID: UUWindowID) -> WindowCreator? {
        return windowCreators[windowID]
    }
}

extension WindowCreatorRegistry {
    
    func firstWindowCreator(for windowType: WindowType) throws -> WindowCreator {
        return try windowCreator(with: try firstWindowID(for: windowType))
    }
    
    func firstWindowID(for windowType: WindowType) throws -> UUWindowID {
        guard let windowID = firstWindowID(for: windowType) else {
            throw WindowCreatorRegistryError.notRegisteredWindowForWindowType
        }
        
        return windowID
    }
    
    private func firstWindowID(for windowType: WindowType) -> UUWindowID? {
        return windowCreators.first {
            $0.value.windowType == windowType
        }?.key
    }
}
