//
//  Created by Łukasz Osiennik on 21/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

struct RootAppNavigationNodeEntity<
    DevRootWindowPurpose
>
where
    DevRootWindowPurpose
        : DevRootWindowPurposeInterface {
    
    let windowPurpose: WindowPurpose<
        DevRootWindowPurpose
    >
    
    let windowID: UUWindowID
    
    init(
        windowEntity: WindowEntity<
            DevRootWindowPurpose
        >
    ) {
        self.windowPurpose = windowEntity.purpose
        self.windowID = windowEntity.id
    }
}