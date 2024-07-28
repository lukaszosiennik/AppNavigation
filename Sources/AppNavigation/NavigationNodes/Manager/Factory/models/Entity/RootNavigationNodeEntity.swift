//
//  Created by Łukasz Osiennik on 21/05/2021.
//  Copyright © 2021 Łukasz Osiennik. All rights reserved.
//

struct RootNavigationNodeEntity<
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
