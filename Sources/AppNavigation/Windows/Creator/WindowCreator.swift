//
//  Created by Łukasz Osiennik on 09/02/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

public struct WindowCreator<
    DevRootWindowType
>
where
    DevRootWindowType
        : DevRootWindowTypeInterface {
    
    let entity: WindowEntity<
        DevRootWindowType
    >
    
    let createWindow: Window.Create
    let createViewController: ViewController.Create
    
    public init(
        entity: WindowEntity<
            DevRootWindowType
        >,
        createViewController: @autoclosure @escaping ViewController.Create
    ) {
        self.init(
            entity: entity,
            createWindow: Window.default(
                for: entity.type
            ),
            createViewController: createViewController()
        )
    }
    
    public init(
        entity: WindowEntity<
            DevRootWindowType
        >,
        createWindow: @escaping Window.Create,
        createViewController: @autoclosure @escaping ViewController.Create
    ) {
        self.entity = entity
        self.createWindow = createWindow
        self.createViewController = createViewController
    }
}
