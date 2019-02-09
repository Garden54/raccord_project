//
//  Decor.swift
//  raccord_project
//
//  Created by Ludovic Jardiné on 08/02/2019.
//  Copyright © 2019 Ludovic Jardiné. All rights reserved.
//

import Foundation
import RealmSwift


class Decor: Object {
    
    var parentCategory = LinkingObjects(fromType: Film.self, property: "decors")
    
    @objc dynamic var name : String = ""
}
