//
//  Created by Łukasz Osiennik on 07/05/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

final class RootAppNavigationNodeFactory {
    
    static func create<
        DevRootWindowPurpose
    >(
        windowCreator: WindowCreator<
            DevRootWindowPurpose
        >
    ) -> RootAppNavigationNode<
        DevRootWindowPurpose
    > where
        DevRootWindowPurpose
            : DevRootWindowPurposeInterface {
        return .init(
            entity: .init(
                windowEntity: windowCreator.entity
            ),
            navigationNode: AppNavigationNodeWindowFactory.create(
                showingType: .makeVisible,
                windowCreator: windowCreator
            )
        )
    }
}
