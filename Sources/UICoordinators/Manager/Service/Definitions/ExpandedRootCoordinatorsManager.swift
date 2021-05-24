//
//  Created by Łukasz Osiennik on 24/05/2021.
//  Copyright © 2021 open plainness (https://www.openplainness.com). All rights reserved.
//

public typealias ExpandedRootCoordinatorsManager<SecondaryDevBranchWindowType> = RootCoordinatorsManager<ExpandedDevRootWindowType<SecondaryDevBranchWindowType>> where SecondaryDevBranchWindowType: DevBranchWindowTypeInterface
