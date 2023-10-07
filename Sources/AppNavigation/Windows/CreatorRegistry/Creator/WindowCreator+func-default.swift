//
//  Created by Łukasz Osiennik on 19/05/2021.
//  Copyright © 2021 openplainness (https://www.openplainness.com). All rights reserved.
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
