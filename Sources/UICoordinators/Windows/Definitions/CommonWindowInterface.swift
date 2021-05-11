//
//  Created by Łukasz Osiennik on 16/04/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

import UIKit

public protocol CommonWindowInterface: AnyObject {
    
    var delegate: CommonWindowDelegate? { get set }
    
    var windowID: UUWindowID { get }
    var windowType: WindowType { get }
    
    func setup(delegate: CommonWindowDelegate?)
}

extension CommonWindowInterface {
    
    public func setup(delegate: CommonWindowDelegate?) {
        self.delegate = delegate
    }
}

extension CommonWindowInterface {
    
    static var defaultSize: CGRect {
        return UIScreen.main.bounds
    }
}
