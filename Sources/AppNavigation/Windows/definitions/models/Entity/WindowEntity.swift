//
//  Created by Łukasz Osiennik on 21/05/2021.
//  Copyright © 2021 openplainness (https://www.openplainness.com). All rights reserved.
//

public struct WindowEntity<
    DevRootWindowPurpose
>
where
    DevRootWindowPurpose
        : DevRootWindowPurposeInterface {
    
    public let purpose: WindowPurpose<
        DevRootWindowPurpose
    >
    
    public let id: UUWindowID
    
    public init(
        purpose: WindowPurpose<
            DevRootWindowPurpose
        >
    ) {
        self.purpose = purpose
        self.id = .init()
    }
}
