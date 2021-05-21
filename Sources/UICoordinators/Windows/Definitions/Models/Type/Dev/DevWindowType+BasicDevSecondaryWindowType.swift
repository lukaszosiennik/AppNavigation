//
//  Created by Łukasz Osiennik on 21/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

extension DevWindowType where SecondaryWindowType == BasicDevSecondaryWindowType {
    
    public static var secondary: Self {
        return .secondary(.just)
    }
}
