//
//  Created by Łukasz Osiennik on 03/12/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

import UIKit

public struct CoordinatorViewControllerParams {
    
    let showingType: CoordinatorViewControllerShowingType
    let viewController: UIViewController
    
    public init(showingType: CoordinatorViewControllerShowingType, viewController: UIViewController) {
        self.showingType = showingType
        self.viewController = viewController
    }
}
