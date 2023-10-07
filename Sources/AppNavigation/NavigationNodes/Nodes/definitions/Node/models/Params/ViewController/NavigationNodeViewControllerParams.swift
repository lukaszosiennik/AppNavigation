//
//  Created by Łukasz Osiennik on 03/12/2020.
//  Copyright © 2020 openplainness (https://www.openplainness.com). All rights reserved.
//

import UIKit

public struct NavigationNodeViewControllerParams {
    
    let showingType: NavigationNodeViewControllerShowingType
    let viewController: UIViewController
    
    public init(
        showingType: NavigationNodeViewControllerShowingType,
        viewController: UIViewController
    ) {
        self.showingType = showingType
        self.viewController = viewController
    }
}
