//
//  Created by Łukasz Osiennik on 09/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

public enum RootCoordinatorsManagerError: Error {
    
    case cannotLoadKeyWindowType
    case cannotLoadDevWindowTypeIfAppWindowTypeIsNotRegistered
    case cannotLoadNotRegisteredWindowType
    case cannotUnloadKeyWindowType
    case cannotUnloadAppWindowType
    case cannotUnloadNotRegisteredWindowType
    case cannotUnloadNotLoadedWindowType
    case notLoadedWindowType
}
