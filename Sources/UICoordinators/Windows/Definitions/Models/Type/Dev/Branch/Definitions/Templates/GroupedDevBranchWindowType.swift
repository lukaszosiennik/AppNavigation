//
//  Created by Łukasz Osiennik on 21/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

public enum GroupedDevBranchWindowType<AppTestWindowType, ThirdPartyWindowType>: DevBranchWindowTypeInterface where AppTestWindowType: DevBranchWindowTypeInterface, ThirdPartyWindowType: DevBranchWindowTypeInterface {
    
    case appTest(AppTestWindowType)
    case thirdParty(ThirdPartyWindowType)
}
