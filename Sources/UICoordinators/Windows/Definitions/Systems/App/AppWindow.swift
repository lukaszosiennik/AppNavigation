//
//  Created by Łukasz Osiennik on 10/04/2020.
//  Copyright © 2020 Łukasz Osiennik. All rights reserved.
//

import UIKit

final class AppWindow: CommonWindow {
    
    override init(registeredWindowID: RegisteredWindowID) {
        super.init(registeredWindowID: registeredWindowID)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        let twoFingerDoubleTapGesture = UITapGestureRecognizer()
        twoFingerDoubleTapGesture.numberOfTapsRequired = 2
        twoFingerDoubleTapGesture.numberOfTouchesRequired = 2
        twoFingerDoubleTapGesture.addTarget(self, action: #selector(gestureHandler))
        addGestureRecognizer(twoFingerDoubleTapGesture)
    }
    
    @objc private func gestureHandler() {
        delegate?.switchWindowActionInvoked(on: registeredWindowID)
    }
}
