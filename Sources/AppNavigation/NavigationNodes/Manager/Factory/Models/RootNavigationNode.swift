//
//  Created by Łukasz Osiennik on 11/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

struct RootAppNavigationNode<
    DevRootWindowPurpose
>
where
    DevRootWindowPurpose
        : DevRootWindowPurposeInterface {
    
    let entity: RootAppNavigationNodeEntity<
        DevRootWindowPurpose
    >
    let navigationNode: AppNavigationNode
}
