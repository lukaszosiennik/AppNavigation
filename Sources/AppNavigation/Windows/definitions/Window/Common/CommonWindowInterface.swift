//
//  Created by Łukasz Osiennik on 16/04/2020.
//  Copyright © 2020 Łukasz Osiennik. All rights reserved.
//

import UIKit

public protocol CommonWindowInterface:
    AnyObject {
    
    var delegate: CommonWindowDelegate? {
        get
        set
    }
    
    var windowID: UUWindowID {
        get
    }
    
    func setup(
        delegate: CommonWindowDelegate?
    )
}

extension CommonWindowInterface {
    
    static var defaultSize: CGRect {
        return UIScreen.main.bounds
    }
}
