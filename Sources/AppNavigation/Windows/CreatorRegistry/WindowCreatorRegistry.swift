//
//  Created by Łukasz Osiennik on 11/05/2021.
//  Copyright © 2021 openplainness (https://www.openplainness.com). All rights reserved.
//

public final class WindowCreatorRegistry<
    DevRootWindowPurpose
>
where
    DevRootWindowPurpose
        : DevRootWindowPurposeInterface {
    
    private var windowCreatorsSet: Set<
        WindowCreator<
            DevRootWindowPurpose
        >
    > = .init()
    
    public func register(
        windowCreator: WindowCreator<
            DevRootWindowPurpose
        >
    ) throws {
        guard !isRegistered(
            windowPurpose: windowCreator.entity.purpose
        ) else {
            throw WindowCreatorRegistryError.windowPurposeAlreadyRegistered
        }
        
        windowCreatorsSet.insert(
            windowCreator
        )
    }
    
    public func isRegistered(
        windowPurpose: WindowPurpose<
            DevRootWindowPurpose
        >
    ) -> Bool {
        return (try? windowCreator(
            for: windowPurpose
        )) != nil
    }
    
    public func unregister(
        windowPurpose: WindowPurpose<
            DevRootWindowPurpose
        >
    ) throws {
        guard let windowCreator = try? windowCreator(
            for: windowPurpose
        )  else {
            throw WindowCreatorRegistryError.cannotUnregisterNotRegisteredWindowPurpose
        }
        
        windowCreatorsSet.remove(
            windowCreator
        )
    }
    
    public func unregisterAll() throws {
        guard !windowCreatorsSet.isEmpty else {
            throw WindowCreatorRegistryError.nothingToUnregister
        }
        
        windowCreatorsSet.removeAll()
    }
}

extension WindowCreatorRegistry {
    
    func windowCreator(
        for windowPurpose: WindowPurpose<
            DevRootWindowPurpose
        >
    ) throws -> WindowCreator<
        DevRootWindowPurpose
    > {
        guard let creator = windowCreatorsSet.first(where: {
            $0.entity.purpose == windowPurpose
        }) else {
            throw WindowCreatorRegistryError.notRegisteredWindowPurpose
        }
        
        return creator
    }
}
