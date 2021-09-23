//
//  Created by Łukasz Osiennik on 03/12/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

public enum AppNavigationNodeType {

    case window(params: AppNavigationNodeWindowParams)
    case tabBarController(params: AppNavigationNodeTabBarControllerParams)
    case navigationController(params: AppNavigationNodeNavigationControllerParams)
    case viewController(params: AppNavigationNodeViewControllerParams)
}
