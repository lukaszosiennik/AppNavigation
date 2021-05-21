//
//  Created by Łukasz Osiennik on 21/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

public enum GroupedDevSecondaryWindowTypeTemplate<DevSecondaryTestWindowType, DevSecondaryThirdPartyWindowType>: WindowTypeInterface where DevSecondaryTestWindowType: WindowTypeInterface, DevSecondaryThirdPartyWindowType: WindowTypeInterface {
    
    case test(DevSecondaryTestWindowType)
    case thirdParty(DevSecondaryThirdPartyWindowType)
}
