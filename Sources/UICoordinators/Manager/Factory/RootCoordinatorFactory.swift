//
//  Created by Łukasz Osiennik on 07/05/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

final class RootCoordinatorFactory {
    
    static func create<DevRootWindowType>(windowCreator: WindowCreator<DevRootWindowType>) -> RootCoordinator<DevRootWindowType> where DevRootWindowType: DevRootWindowTypeInterface {
        return .init(
            entity: .init(
                windowEntity: windowCreator.entity
            ),
            coordinator: WindowCoordinatorFactory.create(
                showingType: .makeVisible,
                windowCreator: windowCreator
            )
        )
    }
}
