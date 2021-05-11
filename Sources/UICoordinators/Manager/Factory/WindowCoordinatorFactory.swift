//
//  Created by Łukasz Osiennik on 07/05/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

final class WindowCoordinatorFactory {
    
    func create(windowID: UUWindowID, windowCreator: WindowCreator) -> WindowCoordinatorData {
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
                    window: windowCreator.createWindow(windowID),
                    rootChildCoordinator: rootChildCoordinator
                )
            )
        )
        
        return WindowCoordinatorData(windowID: windowID, coordinator: coordinator)
    }
}
