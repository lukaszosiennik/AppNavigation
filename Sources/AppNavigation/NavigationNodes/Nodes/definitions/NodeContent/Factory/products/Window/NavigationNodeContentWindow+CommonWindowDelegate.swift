//
//  Created by Łukasz Osiennik on 09/05/2021.
//  Copyright © 2021 Łukasz Osiennik. All rights reserved.
//

extension NavigationNodeContentWindow:
    CommonWindowDelegate {
    
    func switchWindowActionInvoked(
        on windowID: UUWindowID
    ) {
        delegate?.switchWindowActionInvoked(
            on: windowID
        )
    }
}
