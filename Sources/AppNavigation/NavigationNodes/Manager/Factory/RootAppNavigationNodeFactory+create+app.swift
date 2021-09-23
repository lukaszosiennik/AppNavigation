//
//  Created by Łukasz Osiennik on 25/05/2021.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

extension RootAppNavigationNodeFactory {
    
    public static func create<
        DevRootWindowPurpose
    >(
        createViewController: @autoclosure @escaping WindowCreator<
            DevRootWindowPurpose
        >.ViewController.Create
    ) -> RootAppNavigationNode<
        DevRootWindowPurpose
    >
    where
        DevRootWindowPurpose
            : DevRootWindowPurposeInterface {
        return create(
            windowCreator: .init(
                entity: .init(
                    purpose: .app
                ),
                createViewController: createViewController()
            )
        )
    }
    
    public static func create<
        DevRootWindowPurpose
    >(
        createWindow: @escaping WindowCreator<
            DevRootWindowPurpose
        >.Window.Create,
        createViewController: @autoclosure @escaping WindowCreator<
            DevRootWindowPurpose
        >.ViewController.Create
    ) -> RootAppNavigationNode<
        DevRootWindowPurpose
    >
    where
        DevRootWindowPurpose
            : DevRootWindowPurposeInterface {
        return create(
            windowCreator: .init(
                entity: .init(
                    purpose: .app
                ),
                createWindow: createWindow,
                createViewController: createViewController()
            )
        )
    }
}
