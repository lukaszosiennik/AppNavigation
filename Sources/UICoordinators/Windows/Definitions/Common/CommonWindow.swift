//
//  Created by Łukasz Osiennik on 17/04/2020.
//  Copyright © 2020 Łukasz Osiennik. All rights reserved.
//

import UIKit

class CommonWindow: CommonWindowAlias {
    
    weak var delegate: CommonWindowDelegate?
    
    let registeredWindowID: RegisteredWindowID
    
    init(registeredWindowID: RegisteredWindowID) {
        self.registeredWindowID = registeredWindowID
        super.init(frame: Self.defaultSize)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(delegate: CommonWindowDelegate?) {
        self.delegate = delegate
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            delegate?.switchWindowActionInvoked(on: registeredWindowID)
        }

        super.motionEnded(motion, with: event)
    }
}
