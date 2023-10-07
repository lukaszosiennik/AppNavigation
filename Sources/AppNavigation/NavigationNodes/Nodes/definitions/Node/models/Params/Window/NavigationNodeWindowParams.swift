//
//  Created by Łukasz Osiennik on 03/12/2020.
//  Copyright © 2020 openplainness (https://www.openplainness.com). All rights reserved.
//

public struct NavigationNodeWindowParams {
    
    let showingType: NavigationNodeWindowShowingType
    let window: CommonWindowAlias
    let rootChildNavigationNode: NavigationNode
    
    public init(
            showingType: NavigationNodeWindowShowingType,
            window: CommonWindowAlias,
            rootChildNavigationNode: NavigationNode
    ) {
        self.showingType = showingType
        self.window = window
        self.rootChildNavigationNode = rootChildNavigationNode
    }
}
