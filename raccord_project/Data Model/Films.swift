//
//  Films.swift
//  raccord_project
//
//  Created by Ludovic Jardiné on 08/02/2019.
//  Copyright © 2019 Ludovic Jardiné. All rights reserved.
//

import Foundation
import RealmSwift


class Film : Object {
    
    let sequences = List<Sequence>()
    let persos = List<Perso>()
    let decors = List<Decor>()
    let accessoires = List<Accessoire>()
    
    @objc dynamic var name : String = ""
    @objc dynamic var dateCreated : Date?
}
