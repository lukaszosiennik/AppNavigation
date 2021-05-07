//
//  Created by Łukasz Osiennik on 02/04/2020.
//  Copyright © 2020 Łukasz Osiennik. All rights reserved.
//

import UIKit

final class TemplateCoordinator: Coordinator {
    
    override init(type: CoordinatorType = .navigationController(params: CoordinatorNavigationControllerParams(showingType: .present, rootViewController: UIViewController()))) {
        super.init(type: type)
    }
}
