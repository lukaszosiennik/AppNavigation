//
//  Created by Łukasz Osiennik on 16/04/2020.
//  Copyright © 2020 Łukasz Osiennik. All rights reserved.
//

import UIKit

protocol CommonWindowInterface: AnyObject {
    
    var delegate: CommonWindowDelegate? { get set }
    
    var registeredWindowID: RegisteredWindowID { get }
    
    func setup(delegate: CommonWindowDelegate?)
}

extension CommonWindowInterface {
    
    func setup(delegate: CommonWindowDelegate?) {
        self.delegate = delegate
    }
}

extension CommonWindowInterface {
    
    static var defaultSize: CGRect {
        return UIScreen.main.bounds
    }
}
