//
//  Created by Łukasz Osiennik on 02/04/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

import UIKit

public final class TemplateNavigationNode:
    NavigationNode {
    
    public override init(
        type: NavigationNodeType = .navigationController(
            params: .init(
                showingType: .present,
                rootViewController: UIViewController()
            )
        )
    ) {
        super.init(
            type: type
        )
    }
}
