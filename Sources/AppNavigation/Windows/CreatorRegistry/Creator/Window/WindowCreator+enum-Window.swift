//
//  Created by Łukasz Osiennik on 19/05/2021.
//  Copyright © 2021 openplainness (https://www.openplainness.com). All rights reserved.
//

extension WindowCreator {
    
    public enum Window {
        
        public typealias Create =
            (_ windowID: UUWindowID) -> CommonWindowAlias
    }
}
