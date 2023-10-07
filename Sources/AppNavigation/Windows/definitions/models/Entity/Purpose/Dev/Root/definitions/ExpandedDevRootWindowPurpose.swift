//
//  Created by Łukasz Osiennik on 21/05/2021.
//  Copyright © 2021 openplainness (https://www.openplainness.com). All rights reserved.
//

public enum ExpandedDevRootWindowPurpose<
    BranchWindowPurpose
>:
    DevRootWindowPurposeInterface
where
    BranchWindowPurpose
        : DevBranchWindowPurposeInterface {
    
    case primary
    case secondary(BranchWindowPurpose)
}
