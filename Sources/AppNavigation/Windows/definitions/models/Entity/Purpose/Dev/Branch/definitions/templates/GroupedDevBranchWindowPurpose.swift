//
//  Created by Łukasz Osiennik on 21/05/2021.
//  Copyright © 2021 Łukasz Osiennik. All rights reserved.
//

public enum GroupedDevBranchWindowPurpose<
    AppTestWindowPurpose,
    ThirdPartyTestWindowPurpose
>:
    GroupedDevBranchWindowPurposeInterface,
    DevBranchWindowPurposeInterface
where
    AppTestWindowPurpose
        : DevBranchWindowPurposeInterface,
    ThirdPartyTestWindowPurpose
        : DevBranchWindowPurposeInterface {
    
    case appTest(AppTestWindowPurpose)
    case thirdPartyTest(ThirdPartyTestWindowPurpose)
}
