//
//  Created by Łukasz Osiennik on 02/04/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

protocol CoordinatorInterface: AnyObject {
    
    var nodeType: CoordinatorNodeType { get }
    
    var parentCoordinator: CoordinatorInterface? { get set }
    
    var childCoordinators: [CoordinatorInterface] { get set }
    
    func display()
    
    func displayChild(_ coordinator: Coordinator)
    
    func hide()
}
