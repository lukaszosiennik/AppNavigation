//
//  Created by Łukasz Osiennik on 23/09/2021.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

public enum AppNavigationType {
    
    case betweenApps
    case withinApp(AppNavigationWithinAppType)
}

public enum AppNavigationWithinAppType {
    
    case betweenRoots
    case withinRoot
}
