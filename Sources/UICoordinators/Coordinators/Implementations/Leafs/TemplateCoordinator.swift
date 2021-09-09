//
//  Created by Łukasz Osiennik on 02/04/2020.
//  Copyright © 2020 open plainness (https://www.openplainness.com). All rights reserved.
//

import UIKit

public final class TemplateCoordinator:
    Coordinator {
    
    public override init(
        type: CoordinatorType = .navigationController(
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
