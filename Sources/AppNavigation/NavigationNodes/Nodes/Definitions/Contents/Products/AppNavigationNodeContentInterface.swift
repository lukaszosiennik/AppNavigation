//
//  Created by Łukasz Osiennik on 24/03/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

import UIKit

protocol AppNavigationNodeContentInterface {
    
    var type: AppNavigationNodeContentType { get }
    
    var viewController: UIViewController { get }
    
    func display(
        on parentViewController: UIViewController
    )
    
    func hide()
}
