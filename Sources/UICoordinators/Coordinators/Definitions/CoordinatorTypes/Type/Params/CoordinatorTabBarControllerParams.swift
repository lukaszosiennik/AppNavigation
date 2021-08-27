//
//  Created by Łukasz Osiennik on 03/12/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

public struct CoordinatorTabBarControllerParams {
    
    let showingType: CoordinatorTabBarControllerShowingType
    let rootChildCoordinators: [Coordinator]
    
    public init(
        showingType: CoordinatorTabBarControllerShowingType,
        rootChildCoordinators: [Coordinator]
    ) {
        self.showingType = showingType
        self.rootChildCoordinators = rootChildCoordinators
    }
}
