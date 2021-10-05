//
//  Created by Łukasz Osiennik on 07/05/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

public final class RootNavigationNodesManager<
    DevRootWindowPurpose:
        DevRootWindowPurposeInterface
>:
    RootNavigationNodesManagerInterface {
    
    public let windowCreatorRegistry: WindowCreatorRegistry<
        DevRootWindowPurpose
    > = .init()
    
    private var rootNavigationNodesSet: Set<
        RootNavigationNode<
            DevRootWindowPurpose
        >
    > = .init()
    private var keyRootNavigationNode: RootNavigationNode<
        DevRootWindowPurpose
    >?
    
    public init() {}
    
    public func load(
        _ windowPurpose: WindowPurpose<
            DevRootWindowPurpose
        >
    ) throws {
        guard windowPurpose != keyRootNavigationNode?.entity.windowPurpose else {
            throw RootNavigationNodesManagerError.cannotLoadKeyWindow
        }
        
        if windowPurpose.isDev {
            guard windowCreatorRegistry.isRegistered(
                    windowPurpose: .app
            ) else {
                throw RootNavigationNodesManagerError.cannotLoadDevWindowPurposeIfAppWindowPurposeIsNotRegistered
            }
        }
        
        let currentRootNavigationNode: RootNavigationNode<
            DevRootWindowPurpose
        >
        if let navigationNode = try? rootNavigationNode(
            for: windowPurpose
        ) {
            currentRootNavigationNode = navigationNode
        } else {
            guard let windowCreator = try? windowCreatorRegistry.windowCreator(
                for: windowPurpose
            ) else {
                throw RootNavigationNodesManagerError.cannotLoadNotRegisteredWindowPurpose
            }
            
            currentRootNavigationNode = RootNavigationNodeFactory.create(
                windowCreator: windowCreator
            )
            
            rootNavigationNodesSet.insert(
                currentRootNavigationNode
            )
        }
        
        changeKeyRootNavigationNode(
            using: currentRootNavigationNode
        )
        
        currentRootNavigationNode.navigationNode.display()
    }
    
    public func unload(
        _ windowPurpose: WindowPurpose<
            DevRootWindowPurpose
        >
    ) throws {
        guard windowPurpose != keyRootNavigationNode?.entity.windowPurpose else {
            throw RootNavigationNodesManagerError.cannotUnloadKeyWindow
        }
        
        guard !windowPurpose.isApp else {
            throw RootNavigationNodesManagerError.cannotUnloadAppWindowPurpose
        }
        
        guard (try? windowCreatorRegistry.windowCreator(
            for: windowPurpose
        )) != nil else {
            throw RootNavigationNodesManagerError.cannotUnloadNotRegisteredWindowPurpose
        }
        
        guard let navigationNode = try? rootNavigationNode(
            for: windowPurpose
        ) else {
            throw RootNavigationNodesManagerError.cannotUnloadNotLoadedWindowPurpose
        }
        
        rootNavigationNodesSet.remove(
            navigationNode
        )
    }
    
    private func changeKeyRootNavigationNode(
        using rootNavigationNode: RootNavigationNode<
            DevRootWindowPurpose
        >
    ) {
        navigationNodeContentWindow(
            from: keyRootNavigationNode
        )?.delegate = nil
        navigationNodeContentWindow(
            from: rootNavigationNode
        )?.delegate = self
        
        keyRootNavigationNode = rootNavigationNode
    }
}

extension RootNavigationNodesManager {
        
    func rootNavigationNode(
        for windowPurpose: WindowPurpose<
            DevRootWindowPurpose
        >
    ) throws -> RootNavigationNode<
        DevRootWindowPurpose
    > {
        guard let navigationNode = rootNavigationNodesSet.first(where: {
            $0.entity.windowPurpose == windowPurpose
        }) else {
            throw RootNavigationNodesManagerError.notLoadedWindowPurpose
        }
        
        return navigationNode
    }
}

extension RootNavigationNodesManager {
    
    private func navigationNodeContentWindow(
        from rootNavigationNode: RootNavigationNode<
            DevRootWindowPurpose
        >?
    ) -> NavigationNodeContentWindow? {
        return rootNavigationNode?.navigationNode.content as? NavigationNodeContentWindow
    }
}

extension RootNavigationNodesManager: NavigationNodeContentWindowDelegate {
    
    public func switchWindowActionInvoked(
        on windowID: UUWindowID
    ) {
        // TODO: this code should be enabled only for DEBUG builds
//        #if DEBUG
        guard let windowPurpose = rootNavigationNodesSet.first(where: {
            $0.entity.windowID == windowID
        })?.entity.windowPurpose else {
            return
        }
        
        switch windowPurpose {
        case .app:
            try? load(
                .dev
            )
        case .dev:
            try? load(
                .app
            )
        }
//        #endif
    }
}
