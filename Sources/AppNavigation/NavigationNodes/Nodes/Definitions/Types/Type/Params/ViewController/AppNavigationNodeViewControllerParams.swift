//
//  Created by Łukasz Osiennik on 03/12/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

import UIKit

public struct AppNavigationNodeViewControllerParams {
    
    let showingType: AppNavigationNodeViewControllerShowingType
    let viewController: UIViewController
    
    public init(
        showingType: AppNavigationNodeViewControllerShowingType,
        viewController: UIViewController
    ) {
        self.showingType = showingType
        self.viewController = viewController
    }
}
