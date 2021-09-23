//
//  Created by Łukasz Osiennik on 25/05/2021.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

extension RootCoordinatorFactory {
    
    public static func create<
        DevRootWindowType
    >(
        createViewController: @autoclosure @escaping WindowCreator<
            DevRootWindowType
        >.ViewController.Create
    ) -> RootCoordinator<
        DevRootWindowType
    >
    where
        DevRootWindowType
            : DevRootWindowTypeInterface {
        return create(
            windowCreator: .init(
                entity: .init(
                    type: .app
                ),
                createViewController: createViewController()
            )
        )
    }
    
    public static func create<
        DevRootWindowType
    >(
        createWindow: @escaping WindowCreator<
            DevRootWindowType
        >.Window.Create,
        createViewController: @autoclosure @escaping WindowCreator<
            DevRootWindowType
        >.ViewController.Create
    ) -> RootCoordinator<
        DevRootWindowType
    >
    where
        DevRootWindowType
            : DevRootWindowTypeInterface {
        return create(
            windowCreator: .init(
                entity: .init(
                    type: .app
                ),
                createWindow: createWindow,
                createViewController: createViewController()
            )
        )
    }
}
