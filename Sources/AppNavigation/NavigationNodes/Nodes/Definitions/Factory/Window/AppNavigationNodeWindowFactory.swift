//
//  Created by Łukasz Osiennik on 25/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

final class AppNavigationNodeWindowFactory {
    
    static func create<
        DevRootWindowPurpose
    >(
        showingType: AppNavigationNodeWindowShowingType,
        windowCreator: WindowCreator<
            DevRootWindowPurpose
        >
    ) -> AppNavigationNode where
        DevRootWindowPurpose
            : DevRootWindowPurposeInterface {
        let rootChildNavigationNode: AppNavigationNode = .init(
            type: .viewController(
                params: .init(
                    showingType: .root,
                    viewController: windowCreator.createViewController()
                )
            )
        )
        let navigationNode: AppNavigationNode = .init(
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
