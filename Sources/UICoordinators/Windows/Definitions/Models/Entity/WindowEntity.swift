//
//  Created by Łukasz Osiennik on 21/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

public struct WindowEntity<
    DevRootWindowType
>
where
    DevRootWindowType
        : DevRootWindowTypeInterface {
    
    public let type: WindowType<
        DevRootWindowType
    >
    
    public let id: UUWindowID
    
    public init(
        type: WindowType<
            DevRootWindowType
        >
    ) {
        self.type = type
        self.id = .init()
    }
}
