//
//  Created by Łukasz Osiennik on 09/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

public enum WindowCoordinatorsManagerError: Error {
    
    case cannotLoadKeyWindowID
    case cannotLoadDevWindowIDIfAppWindowIDIsNotRegistered
    case cannotUnloadKeyWindowID
    case cannotUnloadNotLoadedWindowID
    case cannotUnloadAppWindowID
}
