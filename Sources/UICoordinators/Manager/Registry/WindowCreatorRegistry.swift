//
//  Created by Łukasz Osiennik on 11/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

public final class WindowCreatorRegistry<DevRootWindowType> where DevRootWindowType: DevRootWindowTypeInterface {
    
    private var windowCreatorsSet = Set<WindowCreator<DevRootWindowType>>()
    
    public func register(windowCreator: WindowCreator<DevRootWindowType>) throws {
        guard !isRegistered(windowType: windowCreator.entity.type) else {
            throw WindowCreatorRegistryError.windowTypeAlreadyRegistered
        }
        
        windowCreatorsSet.insert(windowCreator)
    }
    
    public func isRegistered(windowType: WindowType<DevRootWindowType>) -> Bool {
        return (try? windowCreator(for: windowType)) != nil
    }
    
    public func unregister(windowType: WindowType<DevRootWindowType>) throws {
        guard let windowCreator = try? windowCreator(for: windowType)  else {
            throw WindowCreatorRegistryError.cannotUnregisterNotRegisteredWindowType
        }
        
        windowCreatorsSet.remove(windowCreator)
    }
    
    public func unregisterAll() throws {
        guard !windowCreatorsSet.isEmpty else {
            throw WindowCreatorRegistryError.nothingToUnregister
        }
        
        windowCreatorsSet.removeAll()
    }
}

extension WindowCreatorRegistry {
    
    func windowCreator(for windowType: WindowType<DevRootWindowType>) throws -> WindowCreator<DevRootWindowType> {
        guard let creator = windowCreatorsSet.first(where: {
            $0.entity.type == windowType
        }) else {
            throw WindowCreatorRegistryError.notRegisteredWindowType
        }
        
        return creator
    }
}
