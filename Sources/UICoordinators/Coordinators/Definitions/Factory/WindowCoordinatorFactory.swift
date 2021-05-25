//
//  Created by Łukasz Osiennik on 25/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

final class WindowCoordinatorFactory {
    
    static func create<DevRootWindowType>(showingType: CoordinatorWindowShowingType, windowCreator: WindowCreator<DevRootWindowType>) -> Coordinator where DevRootWindowType: DevRootWindowTypeInterface {
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
                    showingType: showingType,
                    window: windowCreator.createWindow(windowCreator.entity.id),
                    rootChildCoordinator: rootChildCoordinator
                )
            )
        )
        
        return coordinator
    }
}
