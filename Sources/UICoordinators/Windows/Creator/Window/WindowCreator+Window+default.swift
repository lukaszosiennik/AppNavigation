//
//  Created by Łukasz Osiennik on 11/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

extension WindowCreator.Window {
    
    static func `default`<DevRootWindowType>(for windowType: WindowType<DevRootWindowType>) -> Create where
        DevRootWindowType: DevRootWindowTypeInterface
    {
        switch windowType {
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
