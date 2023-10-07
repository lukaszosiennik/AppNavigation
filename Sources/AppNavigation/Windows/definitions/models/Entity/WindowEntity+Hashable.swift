//
//  Created by Łukasz Osiennik on 21/05/2021.
//  Copyright © 2021 openplainness (https://www.openplainness.com). All rights reserved.
//

extension WindowEntity:
    Hashable {
    
    public static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        return lhs.purpose == rhs.purpose
    }
    
    public func hash(
        into hasher: inout Hasher
    ) {
        hasher.combine(
            purpose
        )
    }
}
