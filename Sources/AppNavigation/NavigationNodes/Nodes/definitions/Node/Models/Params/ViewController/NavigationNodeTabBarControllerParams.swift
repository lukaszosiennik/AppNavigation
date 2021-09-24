//
//  Created by Łukasz Osiennik on 03/12/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

public struct NavigationNodeTabBarControllerParams {
    
    let showingType: NavigationNodeTabBarControllerShowingType
    let rootChildNavigationNodes: [NavigationNode]
    
    public init(
        showingType: NavigationNodeTabBarControllerShowingType,
        rootChildNavigationNodes: [NavigationNode]
    ) {
        self.showingType = showingType
        self.rootChildNavigationNodes = rootChildNavigationNodes
    }
}
