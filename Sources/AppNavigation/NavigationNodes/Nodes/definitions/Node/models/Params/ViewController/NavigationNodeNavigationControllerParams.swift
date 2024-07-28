//
//  Created by Łukasz Osiennik on 03/12/2020.
//  Copyright © 2020 Łukasz Osiennik. All rights reserved.
//

import UIKit

public struct NavigationNodeNavigationControllerParams {
    
    let showingType: NavigationNodeNavigationControllerShowingType
    let rootViewController: UIViewController
    
    public init(
        showingType: NavigationNodeNavigationControllerShowingType,
        rootViewController: UIViewController
    ) {
        self.showingType = showingType
        self.rootViewController = rootViewController
    }
}
