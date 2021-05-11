//
//  Created by Łukasz Osiennik on 17/04/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

import UIKit

open class CommonWindow: CommonWindowAlias {
    
    weak public var delegate: CommonWindowDelegate?
    
    public let windowID: UUWindowID
    public let windowType: WindowType
    
    public init(windowID: UUWindowID, windowType: WindowType) {
        self.windowID = windowID
        self.windowType = windowType
        super.init(frame: Self.defaultSize)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            delegate?.switchWindowActionInvoked(on: windowID)
        }

        super.motionEnded(motion, with: event)
    }
}
