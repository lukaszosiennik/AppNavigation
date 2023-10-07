//
//  Created by Łukasz Osiennik on 24/05/2021.
//  Copyright © 2021 openplainness (https://www.openplainness.com). All rights reserved.
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
