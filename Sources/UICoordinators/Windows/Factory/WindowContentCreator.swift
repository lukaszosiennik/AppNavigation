//
//  Created by Łukasz Osiennik on 09/02/2021.
//  Copyright © 2021 Łukasz Osiennik. All rights reserved.
//

import UIKit

struct WindowContentCreator {
    
    typealias WindowCreator = (_ registeredWindowID: RegisteredWindowID) -> CommonWindowAlias
    typealias ViewControllerCreator = () -> UIViewController
    
    let windowCreator: WindowCreator
    let viewControllerCreator: ViewControllerCreator
    
    init(windowCreator: @escaping WindowCreator, viewControllerCreator: @autoclosure @escaping ViewControllerCreator) {
        self.windowCreator = windowCreator
        self.viewControllerCreator = viewControllerCreator
    }
}

extension WindowContentCreator {
    
    enum Window {
        
        static var defaultApp: WindowContentCreator.WindowCreator {
            return { registeredWindowID in
                return AppWindow(registeredWindowID: registeredWindowID)
            }
        }
        
        static var defaultDev: WindowContentCreator.WindowCreator {
            return { registeredWindowID in
                return CommonWindow(registeredWindowID: registeredWindowID)
            }
        }
    }
}
