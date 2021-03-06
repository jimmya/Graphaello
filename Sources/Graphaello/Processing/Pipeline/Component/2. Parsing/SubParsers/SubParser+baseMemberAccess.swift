//
//  PathFromBaseMemberAccessParser.swift
//  Graphaello
//
//  Created by Mathias Quintero on 12/8/19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension SubParser {
    
    static func baseMemberAccess() -> SubParser<BaseMemberAccess, Stage.Parsed.Path> {
        return .init { access in
            if access.accessedField == "Mutation" {
                return Stage.Parsed.Path(apiName: access.base,
                                         target: .mutation,
                                         components: [])
            } else if access.accessedField.first?.isUppercase ?? false {
                return Stage.Parsed.Path(apiName: access.base,
                                         target: .object(access.accessedField),
                                         components: [])
            } else {
                return Stage.Parsed.Path(apiName: access.base,
                                         target: .query,
                                         components: [.property(access.accessedField)])
            }
        }
    }
    
}
