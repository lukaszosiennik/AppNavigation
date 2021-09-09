//
//  Created by Łukasz Osiennik on 21/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

struct RootCoordinatorEntity<
    DevRootWindowType
>
where
    DevRootWindowType
        : DevRootWindowTypeInterface {
    
    let windowType: WindowType<
        DevRootWindowType
    >
    
    let windowID: UUWindowID
    
    init(
        windowEntity: WindowEntity<
            DevRootWindowType
        >
    ) {
        self.windowType = windowEntity.type
        self.windowID = windowEntity.id
    }
}
