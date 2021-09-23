//
//  Created by Łukasz Osiennik on 09/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

extension CoordinatorWindowContent:
    CommonWindowDelegate {
    
    func switchWindowActionInvoked(
        on windowID: UUWindowID
    ) {
        delegate?.switchWindowActionInvoked(
            on: windowID
        )
    }
}
