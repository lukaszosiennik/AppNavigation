//
//  Created by Łukasz Osiennik on 19/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

extension WindowCreator {
    
    static func `default`<
        DevRootWindowType
    >(
        for windowType: WindowType<
            DevRootWindowType
        >
    )
    where
        DevRootWindowType
            : DevRootWindowTypeInterface {}
}
