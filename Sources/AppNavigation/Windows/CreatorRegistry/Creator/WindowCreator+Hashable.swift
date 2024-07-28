//
//  Created by Łukasz Osiennik on 21/05/2021.
//  Copyright © 2021 Łukasz Osiennik. All rights reserved.
//

extension WindowCreator:
    Hashable {
    
    public static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        return lhs.entity == rhs.entity
    }
    
    public func hash(
        into hasher: inout Hasher
    ) {
        hasher.combine(
            entity
        )
    }
}
