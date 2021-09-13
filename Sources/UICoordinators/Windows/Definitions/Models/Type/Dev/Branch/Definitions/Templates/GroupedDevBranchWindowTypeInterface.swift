//
//  Created by Łukasz Osiennik on 13/09/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

public protocol GroupedDevBranchWindowTypeInterface {
    
    associatedtype AppTestWindowType
    associatedtype ThirdPartyTestWindowType
    
    static func appTest(
        _ windowType: AppTestWindowType
    ) -> Self
    
    static func thirdPartyTest(
        _ windowType: ThirdPartyTestWindowType
    ) -> Self
}
