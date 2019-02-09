//
//  Accessoire.swift
//  raccord_project
//
//  Created by Ludovic Jardiné on 08/02/2019.
//  Copyright © 2019 Ludovic Jardiné. All rights reserved.
//

import Foundation
import RealmSwift


class Accessoire: Object {
    var parentCategory = LinkingObjects(fromType: Film.self, property: "accessoires")
    
    @objc dynamic var name : String = ""
}
