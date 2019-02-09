//
//  ViewController.swift
//  raccord_project
//
//  Created by Ludovic Jardiné on 08/02/2019.
//  Copyright © 2019 Ludovic Jardiné. All rights reserved.
//

import UIKit
import RealmSwift

////////////////////////////////////////////////////////////////////////////////////////////////////////////
class FilmViewController: UITableViewController {
    
    let realm = try! Realm()
    var films : Results<Film>?

////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        loadFilm()
        
    }
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //Mark: - TableView Datasource Methods
////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return films?.count ?? 1
        
    }
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath)
            
        cell.textLabel?.text = films?[indexPath.row].name ?? "No films addeed yet."
        return cell
        
    }
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //Mark: - TableView Delegate Methods
////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToHome", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! HomeViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedFilm = films?[indexPath.row]
        }
        
    }
    
    
    
    
    
    
        
////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //Mark: - Ajouter un film
////////////////////////////////////////////////////////////////////////////////////////////////////////////

    @IBAction func addFilmPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Film", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Film", style: .default) { (action) in
            let newFilm = Film()
            newFilm.name = textField.text!
            newFilm.dateCreated = Date()
            self.saveFilm(film: newFilm)
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new film"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //MARK: - Data Manipulation Methods
////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    func saveFilm(film: Film) {
        do {
            try realm.write {
                realm.add(film)
            }
        } catch {
            print("Error saving context for film \(error)")
        }
        
        tableView.reloadData()
    }
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func loadFilm() {
        
        films = realm.objects(Film.self)
        
        tableView.reloadData()
        
    }
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
