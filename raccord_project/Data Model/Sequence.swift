//
//  Sequence.swift
//  raccord_project
//
//  Created by Ludovic Jardiné on 08/02/2019.
//  Copyright © 2019 Ludovic Jardiné. All rights reserved.
//

import Foundation
import RealmSwift


class Sequence: Object {
    
    var parentCategory = LinkingObjects(fromType: Film.self, property: "sequences")
    
    
    @objc dynamic var name : String = ""
}

