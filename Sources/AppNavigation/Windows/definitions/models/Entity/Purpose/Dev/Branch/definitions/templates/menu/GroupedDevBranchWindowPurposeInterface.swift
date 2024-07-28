//
//  Created by Łukasz Osiennik on 13/09/2021.
//  Copyright © 2021 Łukasz Osiennik. All rights reserved.
//

public protocol GroupedDevBranchWindowPurposeInterface {
    
    associatedtype AppTestWindowPurpose
    associatedtype ThirdPartyTestWindowPurpose
    
    static func appTest(
        _ windowPurpose: AppTestWindowPurpose
    ) -> Self
    
    static func thirdPartyTest(
        _ windowPurpose: ThirdPartyTestWindowPurpose
    ) -> Self
}
