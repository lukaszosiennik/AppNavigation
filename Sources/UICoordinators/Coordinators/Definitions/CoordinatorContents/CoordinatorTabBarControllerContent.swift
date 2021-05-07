//
//  Created by Łukasz Osiennik on 05/11/2020.
//  Copyright © 2020 Łukasz Osiennik. All rights reserved.
//

import UIKit

final class CoordinatorTabBarControllerContent: CoordinatorBasicContentInterface {
    
    let type: CoordinatorContentType = .tabBarController
    
    private let tabBarController: UITabBarController
    
    var viewController: UIViewController {
        return tabBarController
    }
    
    private let showingType: CoordinatorTabBarControllerShowingType
    
    init(showingType: CoordinatorTabBarControllerShowingType, viewControllers: [UIViewController]) {
        self.tabBarController = UITabBarController()
        self.tabBarController.viewControllers = viewControllers
        self.showingType = showingType
    }
    
    func display(on parentViewController: UIViewController) {
        guard !parentViewController.isTemporary else {
            return
        }
        
        switch showingType {
        case .undefined, .root:
            break
        case .present:
            parentViewController.present(tabBarController, animated: true, completion: nil)
        }
    }
    
    func hide() {
        switch showingType {
        case .undefined, .root:
            break
        case .present:
            tabBarController.dismiss(animated: true, completion: nil)
        }
    }
}
