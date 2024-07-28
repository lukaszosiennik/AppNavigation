//
//  Created by Łukasz Osiennik on 24/05/2021.
//  Copyright © 2021 Łukasz Osiennik. All rights reserved.
//

public typealias ExpandedRootNavigationNodesManager<
    SecondaryDevBranchWindowPurpose
> =
    RootNavigationNodesManager<
        ExpandedDevRootWindowPurpose<
            SecondaryDevBranchWindowPurpose
        >
    >
    where
    SecondaryDevBranchWindowPurpose
        : DevBranchWindowPurposeInterface
