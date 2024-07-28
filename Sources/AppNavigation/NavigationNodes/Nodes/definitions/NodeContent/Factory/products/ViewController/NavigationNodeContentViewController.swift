//
//  Created by Łukasz Osiennik on 24/03/2020.
//  Copyright © 2020 Łukasz Osiennik. All rights reserved.
//

import UIKit

final class NavigationNodeContentViewController:
    NavigationNodeContentViewControllerInterface {
    
    let type: NavigationNodeContentType = .viewController
    
    let viewController: UIViewController
    
    private let showingType: NavigationNodeViewControllerShowingType
    
    init(
        params: NavigationNodeViewControllerParams
    ) {
        self.viewController = params.viewController
        self.showingType = params.showingType
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
                viewController,
                animated: true,
                completion: nil
            )
        case .push:
            parentViewController.navigationController?.pushViewController(
                viewController,
                animated: true
            )
        }
    }
    
    func hide() {
        switch showingType {
        case .undefined, .root:
            break
        case .present:
            viewController.dismiss(
                animated: true,
                completion: nil
            )
        case .push:
            viewController.navigationController?.popViewController(
                animated: true
            )
        }
    }
}
