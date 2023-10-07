//
//  Created by Łukasz Osiennik on 09/02/2021.
//  Copyright © 2021 openplainness (https://www.openplainness.com). All rights reserved.
//

public struct WindowCreator<
    DevRootWindowPurpose
>
where
    DevRootWindowPurpose
        : DevRootWindowPurposeInterface {
    
    let entity: WindowEntity<
        DevRootWindowPurpose
    >
    
    let createWindow: Window.Create
    let createViewController: ViewController.Create
    
    public init(
        entity: WindowEntity<
            DevRootWindowPurpose
        >,
        createViewController: @autoclosure @escaping ViewController.Create
    ) {
        self.init(
            entity: entity,
            createWindow: Window.default(
                for: entity.purpose
            ),
            createViewController: createViewController()
        )
    }
    
    public init(
        entity: WindowEntity<
            DevRootWindowPurpose
        >,
        createWindow: @escaping Window.Create,
        createViewController: @autoclosure @escaping ViewController.Create
    ) {
        self.entity = entity
        self.createWindow = createWindow
        self.createViewController = createViewController
    }
}
