//
//  Created by Łukasz Osiennik on 20/03/2020.
//  Copyright © 2020 Łukasz Osiennik. All rights reserved.
//

import UIKit

public class NavigationNode {

    var nodeLevelType: NavigationNodeLevelType {
        return parentNavigationNode == nil ?
            .root : .subtree
    }
    
    var nodeChildrenType: NavigationNodeChildrenType {
        return childNavigationNodes.count > 0 ?
            .branch : .leaf
    }
    
    weak var parentNavigationNode: NavigationNode?
    var childNavigationNodes: [NavigationNode] = []
    
    let content: NavigationNodeContentInterface
    
    private var viewController: UIViewController {
        return content.viewController
    }
    
    public init(
        type: NavigationNodeType
    ) {
        self.content = NavigationNodeContentFactory.create(
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
        _ navigationNode: NavigationNode
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
        withContent type: NavigationNodeContentType
    ) {}
    
    private func bindRootChildrenIfAny(
        for type: NavigationNodeType
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
        _ navigationNode: NavigationNode
    ) {
        bindRootChildren(
            [navigationNode]
        )
    }
    
    private func bindRootChildren(
        _ navigationNodes: [NavigationNode]
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
