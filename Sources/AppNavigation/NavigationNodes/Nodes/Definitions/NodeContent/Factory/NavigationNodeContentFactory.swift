//
//  Created by Łukasz Osiennik on 24/03/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

final class NavigationNodeContentFactory {

    static func create(
        for navigationNodeType: NavigationNodeType
    ) -> NavigationNodeContentInterface {
        switch navigationNodeType {
        case .window(let params):
            return NavigationNodeContentWindow(
                window: params.window,
                showingType: params.showingType,
                rootViewController: params.rootChildNavigationNode.content.viewController
            )
        case .tabBarController(let params):
            return NavigationNodeContentTabBarController(
                showingType: params.showingType,
                viewControllers: params.rootChildNavigationNodes.map {
                    $0.content.viewController
                }
            )
        case .navigationController(let params):
            return NavigationNodeContentNavigationController(
                params: params
            )
        case .viewController(let params):
            return NavigationNodeContentViewController(
                params: params
            )
        }
    }
}
