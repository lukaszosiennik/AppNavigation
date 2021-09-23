//
//  Created by Łukasz Osiennik on 24/03/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

import UIKit

final class AppNavigationNodeContentWindow:
    AppNavigationNodeContentInterface {
    
    weak var delegate: AppNavigationNodeContentWindowDelegate?
    
    let type: AppNavigationNodeContentType
    
    private let window: CommonWindowAlias
    
    var viewController: UIViewController {
        return window.rootViewController!
    }
    
    private let showingType: AppNavigationNodeWindowShowingType
    
    init(
        window: CommonWindowAlias,
        showingType: AppNavigationNodeWindowShowingType,
        rootViewController: UIViewController
    ) {
        self.type = .window
        self.window = window
        self.window.rootViewController = rootViewController
        self.showingType = showingType
        
        setup()
    }
    
    private func setup() {
        window.setup(
            delegate: self
        )
    }
    
    func display(
        on parentViewController: UIViewController
    ) {
        switch showingType {
        case .undefined:
            break
        case .makeVisible:
            window.makeKeyAndVisible()
        }
    }
    
    func hide() {
        switch showingType {
        case .undefined:
            break
        case .makeVisible:
            window.rootViewController = nil
        }
    }
}
