//
//  Created by Łukasz Osiennik on 07/05/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

public final class RootAppNavigationNodesManager<
    DevRootWindowPurpose:
        DevRootWindowPurposeInterface
>:
    RootAppNavigationNodesManagerInterface {
    
    public let windowCreatorRegistry: WindowCreatorRegistry<
        DevRootWindowPurpose
    > = .init()
    
    private var rootAppNavigationNodesSet: Set<
        RootAppNavigationNode<
            DevRootWindowPurpose
        >
    > = .init()
    private var keyRootAppNavigationNode: RootAppNavigationNode<
        DevRootWindowPurpose
    >?
    
    public init() {}
    
    public func load(
        _ windowPurpose: WindowPurpose<
            DevRootWindowPurpose
        >
    ) throws {
        guard windowPurpose != keyRootAppNavigationNode?.entity.windowPurpose else {
            throw RootAppNavigationNodesManagerError.cannotLoadKeyWindow
        }
        
        if windowPurpose.isDev {
            guard windowCreatorRegistry.isRegistered(
                    windowPurpose: .app
            ) else {
                throw RootAppNavigationNodesManagerError.cannotLoadDevWindowPurposeIfAppWindowPurposeIsNotRegistered
            }
        }
        
        let currentRootAppNavigationNode: RootAppNavigationNode<
            DevRootWindowPurpose
        >
        if let appNavigationNode = try? rootAppNavigationNode(
            for: windowPurpose
        ) {
            currentRootAppNavigationNode = appNavigationNode
        } else {
            guard let windowCreator = try? windowCreatorRegistry.windowCreator(
                for: windowPurpose
            ) else {
                throw RootAppNavigationNodesManagerError.cannotLoadNotRegisteredWindowPurpose
            }
            
            currentRootAppNavigationNode = RootAppNavigationNodeFactory.create(
                windowCreator: windowCreator
            )
            
            rootAppNavigationNodesSet.insert(
                currentRootAppNavigationNode
            )
        }
        
        changeKeyRootAppNavigationNode(
            using: currentRootAppNavigationNode
        )
        
        currentRootAppNavigationNode.navigationNode.display()
    }
    
    public func unload(
        _ windowPurpose: WindowPurpose<
            DevRootWindowPurpose
        >
    ) throws {
        guard windowPurpose != keyRootAppNavigationNode?.entity.windowPurpose else {
            throw RootAppNavigationNodesManagerError.cannotUnloadKeyWindow
        }
        
        guard !windowPurpose.isApp else {
            throw RootAppNavigationNodesManagerError.cannotUnloadAppWindowPurpose
        }
        
        guard (try? windowCreatorRegistry.windowCreator(
            for: windowPurpose
        )) != nil else {
            throw RootAppNavigationNodesManagerError.cannotUnloadNotRegisteredWindowPurpose
        }
        
        guard let navigationNode = try? rootAppNavigationNode(
            for: windowPurpose
        ) else {
            throw RootAppNavigationNodesManagerError.cannotUnloadNotLoadedWindowPurpose
        }
        
        rootAppNavigationNodesSet.remove(
            navigationNode
        )
    }
    
    private func changeKeyRootAppNavigationNode(
        using rootAppNavigationNode: RootAppNavigationNode<
            DevRootWindowPurpose
        >
    ) {
        appNavigationNodeContentWindow(
            from: keyRootAppNavigationNode
        )?.delegate = nil
        appNavigationNodeContentWindow(
            from: rootAppNavigationNode
        )?.delegate = self
        
        keyRootAppNavigationNode = rootAppNavigationNode
    }
}

extension RootAppNavigationNodesManager {
        
    func rootAppNavigationNode(
        for windowPurpose: WindowPurpose<
            DevRootWindowPurpose
        >
    ) throws -> RootAppNavigationNode<
        DevRootWindowPurpose
    > {
        guard let appNavigationNode = rootAppNavigationNodesSet.first(where: {
            $0.entity.windowPurpose == windowPurpose
        }) else {
            throw RootAppNavigationNodesManagerError.notLoadedWindowPurpose
        }
        
        return appNavigationNode
    }
}

extension RootAppNavigationNodesManager {
    
    private func appNavigationNodeContentWindow(
        from rootNavigationNode: RootAppNavigationNode<
            DevRootWindowPurpose
        >?
    ) -> AppNavigationNodeContentWindow? {
        return rootNavigationNode?.navigationNode.content as? AppNavigationNodeContentWindow
    }
}

extension RootAppNavigationNodesManager: AppNavigationNodeContentWindowDelegate {
    
    public func switchWindowActionInvoked(
        on windowID: UUWindowID
    ) {
        // TODO: this code should be enabled only for DEBUG builds
//        #if DEBUG
        guard let windowPurpose = rootAppNavigationNodesSet.first(where: {
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
