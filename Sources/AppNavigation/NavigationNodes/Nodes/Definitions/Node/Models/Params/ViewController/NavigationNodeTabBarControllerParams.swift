//
//  Created by Łukasz Osiennik on 03/12/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

public struct AppNavigationNodeTabBarControllerParams {
    
    let showingType: AppNavigationNodeTabBarControllerShowingType
    let rootChildNavigationNodes: [AppNavigationNode]
    
    public init(
        showingType: AppNavigationNodeTabBarControllerShowingType,
        rootChildNavigationNodes: [AppNavigationNode]
    ) {
        self.showingType = showingType
        self.rootChildNavigationNodes = rootChildNavigationNodes
    }
}
