//
//  Created by Łukasz Osiennik on 25/05/2021.
//  Copyright © 2021 Łukasz Osiennik. All rights reserved.
//

final class NavigationNodeWindowFactory {
    
    static func create<
        DevRootWindowPurpose
    >(
        showingType: NavigationNodeWindowShowingType,
        windowCreator: WindowCreator<
            DevRootWindowPurpose
        >
    ) -> NavigationNode where
        DevRootWindowPurpose
            : DevRootWindowPurposeInterface {
        let rootChildNavigationNode: NavigationNode = .init(
            type: .viewController(
                params: .init(
                    showingType: .root,
                    viewController: windowCreator.createViewController()
                )
            )
        )
        let navigationNode: NavigationNode = .init(
            type: .window(
                params: .init(
                    showingType: showingType,
                    window: windowCreator.createWindow(
                        windowCreator.entity.id
                    ),
                    rootChildNavigationNode: rootChildNavigationNode
                )
            )
        )
        
        return navigationNode
    }
}
