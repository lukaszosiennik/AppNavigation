//
//  Created by Łukasz Osiennik on 21/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

public enum GroupedDevBranchWindowType<AppTestWindowType, ThirdPartyTestWindowType>: DevBranchWindowTypeInterface where AppTestWindowType: DevBranchWindowTypeInterface, ThirdPartyTestWindowType: DevBranchWindowTypeInterface {
    
    case appTest(AppTestWindowType)
    case thirdPartyTest(ThirdPartyTestWindowType)
}
