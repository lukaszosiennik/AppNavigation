//
//  Created by Łukasz Osiennik on 11/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

final class WindowCreatorRegistry<DevSecondaryWindowType> where DevSecondaryWindowType: WindowTypeInterface {
    
    private var windowCreatorsSet = Set<WindowCreator<DevSecondaryWindowType>>()
    
    func register(windowCreator: WindowCreator<DevSecondaryWindowType>) throws {
        if windowCreator.entity.type.isApp {
            guard !isRegistered(windowType: .app) else {
                throw WindowCreatorRegistryError.appWindowTypeAlreadyRegistered
            }
        }
        
        windowCreatorsSet.insert(windowCreator)
    }
    
    func isRegistered(windowType: WindowType<DevSecondaryWindowType>) -> Bool {
        return (try? windowCreator(for: windowType)) != nil
    }
    
    func unregister(windowType: WindowType<DevSecondaryWindowType>) throws {
        guard let windowCreator = try? windowCreator(for: windowType)  else {
            throw WindowCreatorRegistryError.cannotUnregisterNotRegisteredWindowType
        }
        
        windowCreatorsSet.remove(windowCreator)
    }
    
    func unregisterAll() throws {
        guard !windowCreatorsSet.isEmpty else {
            throw WindowCreatorRegistryError.nothingToUnregister
        }
        
        windowCreatorsSet.removeAll()
    }
}

extension WindowCreatorRegistry {
    
    func windowCreator(for windowType: WindowType<DevSecondaryWindowType>) throws -> WindowCreator<DevSecondaryWindowType> {
        guard let creator = windowCreatorsSet.first(where: { $0.entity.type == windowType }) else {
            throw WindowCreatorRegistryError.notRegisteredWindowType
        }
        
        return creator
    }
}
