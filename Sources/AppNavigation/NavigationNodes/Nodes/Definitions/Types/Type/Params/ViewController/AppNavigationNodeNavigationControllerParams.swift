//
//  Created by Łukasz Osiennik on 03/12/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

import UIKit

public struct AppNavigationNodeNavigationControllerParams {
    
    let showingType: AppNavigationNodeNavigationControllerShowingType
    let rootViewController: UIViewController
    
    public init(
        showingType: AppNavigationNodeNavigationControllerShowingType,
        rootViewController: UIViewController
    ) {
        self.showingType = showingType
        self.rootViewController = rootViewController
    }
}
