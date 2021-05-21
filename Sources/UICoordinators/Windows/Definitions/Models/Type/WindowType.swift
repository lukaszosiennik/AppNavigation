//
//  Created by Łukasz Osiennik on 09/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

public enum WindowType<DevSecondaryWindowType>: WindowTypeInterface where DevSecondaryWindowType: WindowTypeInterface {
    
    case app
    case dev(DevWindowType<DevSecondaryWindowType>)
}

extension WindowType {
    
    public static var dev: WindowType<DevSecondaryWindowType> {
        return .dev(.main)
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
