//
//  Created by Łukasz Osiennik on 05/11/2020.
//  Copyright © 2020 Łukasz Osiennik. All rights reserved.
//

import UIKit

final class NavigationNodeContentTabBarController:
    NavigationNodeContentViewControllerInterface {
    
    let type: NavigationNodeContentType = .tabBarController
    
    private let tabBarController: UITabBarController
    
    var viewController: UIViewController {
        return tabBarController
    }
    
    private let showingType: NavigationNodeTabBarControllerShowingType
    
    init(
        showingType: NavigationNodeTabBarControllerShowingType,
        viewControllers: [UIViewController]
    ) {
        self.tabBarController = .init()
        self.tabBarController.viewControllers = viewControllers
        self.showingType = showingType
    }
    
    func display(
        on parentViewController: UIViewController
    ) {
        guard !parentViewController.isTemporary else {
            return
        }
        
        switch showingType {
        case .undefined, .root:
            break
        case .present:
            parentViewController.present(
                tabBarController,
                animated: true,
                completion: nil
            )
        }
    }
    
    func hide() {
        switch showingType {
        case .undefined, .root:
            break
        case .present:
            tabBarController.dismiss(
                animated: true,
                completion: nil
            )
        }
    }
}
