//
//  Created by Łukasz Osiennik on 21/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

public enum GroupedDevBranchWindowType<TestWindowType, ThirdPartyWindowType>: DevBranchWindowTypeInterface where TestWindowType: DevBranchWindowTypeInterface, ThirdPartyWindowType: DevBranchWindowTypeInterface {
    
    case test(TestWindowType)
    case thirdParty(ThirdPartyWindowType)
}
