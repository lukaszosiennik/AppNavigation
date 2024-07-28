//
//  Created by Łukasz Osiennik on 11/05/2021.
//  Copyright © 2021 Łukasz Osiennik. All rights reserved.
//

public enum WindowCreatorRegistryError:
    Error {
    
    case windowPurposeAlreadyRegistered
    case cannotUnregisterNotRegisteredWindowPurpose
    case nothingToUnregister
    case notRegisteredWindowPurpose
}
