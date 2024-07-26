//
//  Created by Łukasz Osiennik on 03/12/2020.
//  Copyright © 2020 openplainness (https://www.openplainness.com). All rights reserved.
//

public enum NavigationNodeType {

    case window(params: NavigationNodeWindowParams)
    case tabBarController(params: NavigationNodeTabBarControllerParams)
    case navigationController(params: NavigationNodeNavigationControllerParams)
    case viewController(params: NavigationNodeViewControllerParams)
}