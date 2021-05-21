//
//  Created by Łukasz Osiennik on 21/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

public struct WindowEntity<DevSecondaryWindowType> where DevSecondaryWindowType: WindowTypeInterface {
    
    public let type: WindowType<DevSecondaryWindowType>
    
    public let id: UUWindowID
    
    public init(type: WindowType<DevSecondaryWindowType>) {
        self.type = type
        self.id = UUWindowID()
    }
}
