//
//  Created by Łukasz Osiennik on 07/05/2020.
//  Copyright © 2020 Łukasz Osiennik. All rights reserved.
//

final class RootCoordinatorCache {
    
    private var coordinators: [RegisteredWindowID: Coordinator] = [:]
    
    func provideWith(windowIDRegistryElement: WindowIDRegistryElement) -> Coordinator {
        if let coordinator = coordinators[windowIDRegistryElement.registeredWindowID] {
            return coordinator
        } else {
            return provideAndCache(using: windowIDRegistryElement)
        }
    }
    
    private func provideAndCache(using windowIDRegistryElement: WindowIDRegistryElement) -> Coordinator {
        let registeredWindowID = windowIDRegistryElement.registeredWindowID
        let contentCreator = windowIDRegistryElement.windowID.contentCreator
        
        let rootChildCoordinator = Coordinator(
            type: .viewController(
                params: .init(
                    showingType: .root,
                    viewController: contentCreator.viewControllerCreator()
                )
            )
        )
        let coordinator = Coordinator(
            type: .window(
                params: .init(
                    showingType: .makeVisible,
                    window: contentCreator.windowCreator(registeredWindowID),
                    rootChildCoordinator: rootChildCoordinator
                )
            )
        )
        
        coordinators[registeredWindowID] = coordinator
        
        return coordinator
    }
}
