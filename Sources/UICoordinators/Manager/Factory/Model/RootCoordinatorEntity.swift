//
//  Created by Łukasz Osiennik on 21/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

struct RootCoordinatorEntity<DevSecondaryWindowType> where DevSecondaryWindowType: WindowTypeInterface {
    
    let windowType: WindowType<DevSecondaryWindowType>
    
    let windowID: UUWindowID
    
    init(windowEntity: WindowEntity<DevSecondaryWindowType>) {
        self.windowType = windowEntity.type
        self.windowID = windowEntity.id
    }
}
