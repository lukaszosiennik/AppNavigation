//
//  Created by Łukasz Osiennik on 11/05/2021.
//  Copyright © 2021 openplainness (https://www.openplainness.com). All rights reserved.
//

extension WindowCreator.Window {
    
    static func `default`<
        DevRootWindowPurpose
    >(
        for windowPurpose: WindowPurpose<
            DevRootWindowPurpose
        >
    ) -> Create
    where
        DevRootWindowPurpose
            : DevRootWindowPurposeInterface {
        switch windowPurpose {
        case .app:
            return { windowID in
                return AppWindow(
                    windowID: windowID
                )
            }
        case .dev:
            return { windowID in
                return DevWindow(
                    windowID: windowID
                )
            }
        }
    }
}
