//
//  Created by Łukasz Osiennik on 09/05/2021.
//  Copyright © 2021 Łukasz Osiennik. All rights reserved.
//

public enum RootNavigationNodesManagerError: Error {
    
    case cannotLoadKeyWindow
    case cannotLoadDevWindowPurposeIfAppWindowPurposeIsNotRegistered
    case cannotLoadNotRegisteredWindowPurpose
    case cannotUnloadKeyWindow
    case cannotUnloadAppWindowPurpose
    case cannotUnloadNotRegisteredWindowPurpose
    case cannotUnloadNotLoadedWindowPurpose
    case notLoadedWindowPurpose
}
