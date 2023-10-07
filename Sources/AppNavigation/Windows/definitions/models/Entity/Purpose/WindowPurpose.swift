//
//  Created by Łukasz Osiennik on 09/05/2021.
//  Copyright © 2021 openplainness (https://www.openplainness.com). All rights reserved.
//

public enum WindowPurpose<
    DevRootWindowPurpose
>:
    WindowPurposeInterface
where
    DevRootWindowPurpose
        : DevRootWindowPurposeInterface {
    
    case app
    case dev(DevRootWindowPurpose)
}

extension WindowPurpose {
    
    public static var dev: Self {
        return .dev(.primary)
    }
}

extension WindowPurpose {
    
    public var isApp: Bool {
        switch self {
        case .app:
            return true
        case .dev:
            return false
        }
    }
    
    public var isDev: Bool {
        return !isApp
    }
}
