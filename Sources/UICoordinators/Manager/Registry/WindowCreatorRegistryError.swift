//
//  Created by Łukasz Osiennik on 11/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

enum WindowCreatorRegistryError: Error {
    
    case appWindowTypeAlreadyRegistered
    case cannotUnregisterNotRegisteredWindowType
    case nothingToUnregister
    case notRegisteredWindowType
}
