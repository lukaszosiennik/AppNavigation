//
//  Created by Łukasz Osiennik on 03/12/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

public struct CoordinatorWindowParams {
    
    let showingType: CoordinatorWindowShowingType
    let window: CommonWindowAlias
    let rootChildCoordinator: Coordinator
    
    public init(
        showingType: CoordinatorWindowShowingType,
        window: CommonWindowAlias,
        rootChildCoordinator: Coordinator
    ) {
        self.showingType = showingType
        self.window = window
        self.rootChildCoordinator = rootChildCoordinator
    }
}
