//
//  Created by Łukasz Osiennik on 20/03/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

import UIKit

public class AppNavigationNode {

    var nodeType: AppNavigationNodeLevelType {
        if parentNavigationNode == nil {
            return .root
        } else {
            return .subtree
        }
    }
    
    weak var parentNavigationNode: AppNavigationNode?
    var childNavigationNodes: [AppNavigationNode] = []
    
    let content: AppNavigationNodeContentInterface
    
    private var viewController: UIViewController {
        return content.viewController
    }
    
    public init(
        type: AppNavigationNodeType
    ) {
        self.content = AppNavigationNodeContentFactory.create(
            for: type
        )
        
        bindRootChildrenIfAny(
            for: type
        )
    }
    
    public func display() {
        guard case .window = content.type else {
            return
        }
        
        content.display(
            on: .temporary
        )
    }
    
    public func displayChild(
        _ navigationNode: AppNavigationNode
    ) {
        if case .window = navigationNode.content.type {
            return
        }
        
        bindRootChild(
            navigationNode
        )
        
        navigationNode.content.display(
            on: viewController
        )
    }
    
    public func hide() {
        content.hide()
        
        parentNavigationNode?.childNavigationNodes.removeAll(where: {
            $0 === self
        })
    }
    
    func hide(
        withContent type: AppNavigationNodeContentType
    ) {}
    
    private func bindRootChildrenIfAny(
        for type: AppNavigationNodeType
    ) {
        switch type {
        case .window(let params):
            bindRootChild(
                params.rootChildNavigationNode
            )
        case .tabBarController(let params):
            bindRootChildren(
                params.rootChildNavigationNodes
            )
        case .navigationController(let params):
            bindRootChild(.init(
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
    
    private func bindRootChild(
        _ navigationNode: AppNavigationNode
    ) {
        bindRootChildren(
            [navigationNode]
        )
    }
    
    private func bindRootChildren(
        _ navigationNodes: [AppNavigationNode]
    ) {
        childNavigationNodes.append(
            contentsOf: navigationNodes
        )
        navigationNodes.forEach {
            $0.parentNavigationNode = self
        }
    }
}

private final class TemporaryViewController:
    UIViewController {}

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
