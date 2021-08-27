//
//  Created by Łukasz Osiennik on 24/03/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

import UIKit

final class CoordinatorWindowContent: CoordinatorContentInterface {
    
    weak var delegate: CoordinatorWindowContentDelegate?
    
    let type: CoordinatorContentType
    
    private let window: CommonWindowAlias
    
    var viewController: UIViewController {
        return window.rootViewController!
    }
    
    private let showingType: CoordinatorWindowShowingType
    
    init(
        window: CommonWindowAlias,
        showingType: CoordinatorWindowShowingType,
        rootViewController: UIViewController
    ) {
        self.type = .window
        self.window = window
        self.window.rootViewController = rootViewController
        self.showingType = showingType
        
        setup()
    }
    
    private func setup() {
        window.setup(delegate: self)
    }
    
    func display(on parentViewController: UIViewController) {
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
