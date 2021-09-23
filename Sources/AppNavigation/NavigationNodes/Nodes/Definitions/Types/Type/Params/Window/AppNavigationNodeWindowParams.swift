//
//  Created by Łukasz Osiennik on 03/12/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

public struct AppNavigationNodeWindowParams {
    
    let showingType: AppNavigationNodeWindowShowingType
    let window: CommonWindowAlias
    let rootChildNavigationNode: AppNavigationNode
    
    public init(
            showingType: AppNavigationNodeWindowShowingType,
            window: CommonWindowAlias,
            rootChildNavigationNode: AppNavigationNode
    ) {
        self.showingType = showingType
        self.window = window
        self.rootChildNavigationNode = rootChildNavigationNode
    }
}
