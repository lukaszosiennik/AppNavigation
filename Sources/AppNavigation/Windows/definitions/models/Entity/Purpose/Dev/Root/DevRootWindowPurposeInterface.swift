//
//  Created by Łukasz Osiennik on 24/05/2021.
//  Copyright © 2021 Łukasz Osiennik. All rights reserved.
//

public protocol DevRootWindowPurposeInterface:
    DevWindowPurposeInterface {
    
    static var primary: Self {
        get
    }
}
