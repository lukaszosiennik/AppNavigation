//
//  Created by Łukasz Osiennik on 11/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

struct RootCoordinator<
    DevRootWindowType
>
where
    DevRootWindowType
        : DevRootWindowTypeInterface {
    
    let entity: RootCoordinatorEntity<
        DevRootWindowType
    >
    let coordinator: Coordinator
}
