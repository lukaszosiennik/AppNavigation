//
//  Created by Łukasz Osiennik on 09/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

public enum WindowType<
    DevRootWindowType
>:
    WindowTypeInterface
where
    DevRootWindowType
        : DevRootWindowTypeInterface {
    
    case app
    case dev(DevRootWindowType)
}

extension WindowType {
    
    public static var dev: Self {
        return .dev(.primary)
    }
}

extension WindowType {
    
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
