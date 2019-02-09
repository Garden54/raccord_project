//
//  File.swift
//  raccord_project
//
//  Created by Ludovic Jardiné on 09/02/2019.
//  Copyright © 2019 Ludovic Jardiné. All rights reserved.
//

import Foundation
import RealmSwift

class HomeViewController: UIViewController {
    
    let realm = try! Realm()
    
    @IBOutlet weak var homeSequenceButton: UIBarButtonItem!
    
    var selectedFilm : Film? {
        didSet {
            
        }
    }
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        title = selectedFilm?.name
    }
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //MARK: - Bottom Bar Button Pressed
////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    @IBAction func homeQuadraButtonPressed(_ sender: UIBarButtonItem) {
        
        if sender.tag == 0 {
            performSegue(withIdentifier: "goToSequenceList", sender: self)
    }
    
  
            
    }
    
    
    
}

