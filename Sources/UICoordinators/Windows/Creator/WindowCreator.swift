//
//  Created by Łukasz Osiennik on 09/02/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

public struct WindowCreator {
    
    let windowType: WindowType
    
    let createWindow: Create
    let createViewController: ViewController.Create
    
    public init(windowType: WindowType, createViewController: @autoclosure @escaping ViewController.Create) {
        self.init(windowType: windowType, createWindow: Self.default(for: windowType), createViewController: createViewController())
    }
    
    public init(windowType: WindowType, createWindow: @escaping Create, createViewController: @autoclosure @escaping ViewController.Create) {
        self.windowType = windowType
        self.createWindow = createWindow
        self.createViewController = createViewController
    }
}

extension WindowCreator {
            
    public typealias Create = (_ windowID: UUWindowID) -> CommonWindowAlias
}
