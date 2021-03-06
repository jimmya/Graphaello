//
//  Resolver.swift
//  Graphaello
//
//  Created by Mathias Quintero on 12/8/19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

protocol Resolver {
    func resolve(validated: [Struct<Stage.Validated>]) throws -> [Struct<Stage.Resolved>]
}
