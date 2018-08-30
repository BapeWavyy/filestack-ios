//
//  CellDescriptibleSource.swift
//  Filestack
//
//  Created by Ruben Nine on 11/7/17.
//  Copyright © 2017 Filestack. All rights reserved.
//

import Foundation

protocol CellDescriptibleSource: CustomStringConvertible {
    var iconName: String { get }
}

func ==(lhs: CellDescriptibleSource, rhs: CellDescriptibleSource) -> Bool {
    return lhs.description == rhs.description
}
