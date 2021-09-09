//
//  Created by Łukasz Osiennik on 21/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

extension WindowEntity:
    Hashable {
    
    public static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        return lhs.type == rhs.type
    }
    
    public func hash(
        into hasher: inout Hasher
    ) {
        hasher.combine(
            type
        )
    }
}
