//
//  Created by Łukasz Osiennik on 24/03/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

import UIKit

final class AppNavigationNodeContentNavigationController:
    AppNavigationNodeContentViewControllerInterface {
    
    let type: AppNavigationNodeContentType = .navigationController
    
    private let navigationController: UINavigationController
    
    var viewController: UIViewController {
        return navigationController
    }
    
    private let showingType: AppNavigationNodeNavigationControllerShowingType
    
    init(
        params: AppNavigationNodeNavigationControllerParams
    ) {
        self.navigationController = .init(
            rootViewController: params.rootViewController
        )
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
                navigationController,
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
            navigationController.dismiss(
                animated: true,
                completion: nil
            )
        }
    }
}