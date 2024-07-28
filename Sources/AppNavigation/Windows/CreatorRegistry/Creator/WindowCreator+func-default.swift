//
//  Created by Łukasz Osiennik on 19/05/2021.
//  Copyright © 2021 Łukasz Osiennik. All rights reserved.
//

extension WindowCreator {
    
    static func `default`<
        DevRootWindowPurpose
    >(
        for windowPurpose: WindowPurpose<
            DevRootWindowPurpose
        >
    )
    where
        DevRootWindowPurpose
            : DevRootWindowPurposeInterface {}
}
