//
//  Created by Łukasz Osiennik on 10/04/2020.
//  Copyright © 2020 Łukasz Osiennik. All rights reserved.
//

enum WindowIDType {
    
    case app
    case dev
}

enum WindowID {
    
    case app(WindowContentCreator)
    case dev(WindowContentCreator)
}

extension WindowID {
    
    static func app(viewControllerCreator: @autoclosure @escaping WindowContentCreator.ViewControllerCreator) -> WindowID {
        return .app(WindowContentCreator(windowCreator: WindowContentCreator.Window.defaultApp, viewControllerCreator: viewControllerCreator()))
    }
    
    static func dev(viewControllerCreator: @autoclosure @escaping WindowContentCreator.ViewControllerCreator) -> WindowID {
        return .dev(WindowContentCreator(windowCreator: WindowContentCreator.Window.defaultDev, viewControllerCreator: viewControllerCreator()))
    }
}

extension WindowID {
    
    func `is`(_ windowIDType: WindowIDType) -> Bool {
        switch windowIDType {
        case .app:
            return isApp
        case .dev:
            return isDev
        }
    }
}

extension WindowID {
    
    var isApp: Bool {
        switch self {
        case .app:
            return true
        case .dev:
            return false
        }
    }
    
    var isDev: Bool {
        return !isApp
    }
}

extension WindowID {
    
    var contentCreator: WindowContentCreator {
        switch self {
        case .app(let creator):
            return creator
        case .dev(let creator):
            return creator
        }
    }
}
