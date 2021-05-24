//
//  Created by Łukasz Osiennik on 07/05/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

final class RootCoordinatorFactory {
    
    static func create<DevRootWindowType>(windowCreator: WindowCreator<DevRootWindowType>) -> RootCoordinator<DevRootWindowType> where DevRootWindowType: DevRootWindowTypeInterface {
        let rootChildCoordinator = Coordinator(
            type: .viewController(
                params: .init(
                    showingType: .root,
                    viewController: windowCreator.createViewController()
                )
            )
        )
        let coordinator = Coordinator(
            type: .window(
                params: .init(
                    showingType: .makeVisible,
                    window: windowCreator.createWindow(windowCreator.entity.id),
                    rootChildCoordinator: rootChildCoordinator
                )
            )
        )
        
        return RootCoordinator(entity: RootCoordinatorEntity(windowEntity: windowCreator.entity), coordinator: coordinator)
    }
}
