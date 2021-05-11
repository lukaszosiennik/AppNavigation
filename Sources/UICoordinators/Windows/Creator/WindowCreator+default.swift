//
//  Created by Łukasz Osiennik on 11/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

extension WindowCreator {
    
    static func `default`(for windowType: WindowType) -> Create {
        switch windowType {
        case .app:
            return { windowID in
                return AppWindow(windowID: windowID, windowType: windowType)
            }
        case .dev:
            return { windowID in
                return DevWindow(windowID: windowID, windowType: windowType)
            }
        }
    }
}
