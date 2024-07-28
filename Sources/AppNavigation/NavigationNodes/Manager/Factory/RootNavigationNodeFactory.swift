//
//  Created by Łukasz Osiennik on 07/05/2020.
//  Copyright © 2020 Łukasz Osiennik. All rights reserved.
//

final class RootNavigationNodeFactory {
    
    static func create<
        DevRootWindowPurpose
    >(
        windowCreator: WindowCreator<
            DevRootWindowPurpose
        >
    ) -> RootNavigationNode<
        DevRootWindowPurpose
    > where
        DevRootWindowPurpose
            : DevRootWindowPurposeInterface {
        return .init(
            entity: .init(
                windowEntity: windowCreator.entity
            ),
            navigationNode: NavigationNodeWindowFactory.create(
                showingType: .makeVisible,
                windowCreator: windowCreator
            )
        )
    }
}
