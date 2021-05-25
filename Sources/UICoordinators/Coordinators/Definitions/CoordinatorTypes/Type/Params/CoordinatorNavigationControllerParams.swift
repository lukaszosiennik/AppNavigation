//
//  Created by Łukasz Osiennik on 03/12/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

import UIKit

public struct CoordinatorNavigationControllerParams {
    
    let showingType: CoordinatorNavigationControllerShowingType
    let rootViewController: UIViewController
    
    public init(showingType: CoordinatorNavigationControllerShowingType, rootViewController: UIViewController) {
        self.showingType = showingType
        self.rootViewController = rootViewController
    }
}
