//
//  Created by Łukasz Osiennik on 03/12/2020.
//  Copyright © 2020 Łukasz Osiennik. All rights reserved.
//

enum CoordinatorType {
    
    case window(params: CoordinatorWindowParams)
    case tabBarController(params: CoordinatorTabBarControllerParams)
    case navigationController(params: CoordinatorNavigationControllerParams)
    case viewController(params: CoordinatorViewControllerParams)
}
