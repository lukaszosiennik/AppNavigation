//
//  Created by Łukasz Osiennik on 17/04/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

import UIKit

open class CommonWindow: CommonWindowAlias {
    
    weak public var delegate: CommonWindowDelegate?
    
    public let windowID: UUWindowID
    
    public init(windowID: UUWindowID) {
        self.windowID = windowID
        super.init(frame: Self.defaultSize)
        
        setup()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        let twoFingerDoubleTapGesture = UITapGestureRecognizer()
        twoFingerDoubleTapGesture.numberOfTapsRequired = 2
        twoFingerDoubleTapGesture.numberOfTouchesRequired = 2
        twoFingerDoubleTapGesture.addTarget(self, action: #selector(gestureHandler))
        addGestureRecognizer(twoFingerDoubleTapGesture)
    }
    
    public override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            delegate?.switchWindowActionInvoked(on: windowID)
        }

        super.motionEnded(motion, with: event)
    }
    
    @objc private func gestureHandler() {}
}
