//
//  Created by Łukasz Osiennik on 24/03/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

final class CoordinatorContentFactory {
    
    static func create(for coordinatorType: CoordinatorType) -> CoordinatorContentInterface {
        switch coordinatorType {
        case .window(let params):
            return CoordinatorWindowContent(
                window: params.window,
                showingType: params.showingType,
                rootViewController: params.rootChildCoordinator.content.viewController
            )
        case .tabBarController(let params):
            return CoordinatorTabBarControllerContent(
                showingType: params.showingType,
                viewControllers: params.rootChildCoordinators.map {
                    $0.content.viewController
                }
            )
        case .navigationController(let params):
            return CoordinatorNavigationControllerContent(params: params)
        case .viewController(let params):
            return CoordinatorViewControllerContent(params: params)
        }
    }
}
