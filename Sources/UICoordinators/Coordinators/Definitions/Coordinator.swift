//
//  Created by Łukasz Osiennik on 20/03/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

import UIKit

public class Coordinator: CoordinatorInterface {

    var nodeType: CoordinatorNodeType {
        if parentCoordinator == nil {
            return .root
        } else {
            return .leaf
        }
    }
    
    weak var parentCoordinator: CoordinatorInterface?
    var childCoordinators: [CoordinatorInterface] = []
    
    let content: CoordinatorContentInterface
    
    private var viewController: UIViewController {
        return content.viewController
    }
    
    public init(type: CoordinatorType) {
        self.content = CoordinatorContentFactory.create(for: type)
        
        bindRootChildrenIfAny(for: type)
    }
    
    public func display() {
        guard case .window = content.type else {
            return
        }
        
        content.display(on: .temporary)
    }
    
    public func displayChild(_ coordinator: Coordinator) {
        if case .window = coordinator.content.type {
            return
        }
        
        bindRootChild(coordinator)
        
        coordinator.content.display(on: viewController)
    }
    
    public func hide() {
        content.hide()
        
        parentCoordinator?.childCoordinators.removeAll(where: { $0 === self })
    }
    
    func hide(withContent type: CoordinatorContentType) {}
    
    private func bindRootChildrenIfAny(for type: CoordinatorType) {
        switch type {
        case .window(let params):
            bindRootChild(params.rootChildCoordinator)
        case .tabBarController(let params):
            bindRootChildren(params.rootChildCoordinators)
        case .navigationController(let params):
            bindRootChild(Coordinator(
                type: .viewController(
                    params: .init(
                        showingType: .root,
                        viewController: params.rootViewController
                    )
                )
            ))
        case .viewController:
            break
        }
    }
    
    private func bindRootChild(_ coordinator: Coordinator) {
        bindRootChildren([coordinator])
    }
    
    private func bindRootChildren(_ coordinators: [Coordinator]) {
        childCoordinators.append(contentsOf: coordinators)
        coordinators.forEach { $0.parentCoordinator = self }
    }
}

private final class TemporaryViewController: UIViewController {}

private extension UIViewController {
    
    static var temporary: UIViewController {
        return TemporaryViewController()
    }
}

extension UIViewController {
    
    var isTemporary: Bool {
        return self is TemporaryViewController
    }
}
