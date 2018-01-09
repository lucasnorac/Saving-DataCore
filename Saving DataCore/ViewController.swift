//
//  ViewController.swift
//  Saving DataCore
//
//  Created by Lucas Caron Albarello on 02/01/2018.
//  Copyright © 2018 Lucas Caron Albarello. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    var people = [Person]()
    
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Adicione uma Pessoa", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "nome"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "idade"
            textField.keyboardType = .numberPad
        }
        let action = UIAlertAction(title: "Post", style: .default) { (_) in
             let nome = alert.textFields!.first!.text!
             let idade = alert.textFields!.last!.text!
            print(nome)
            print(idade)
            let person = Person(context: PersistenceServices.context)
            person.nome = nome
            person.idade = Int16(idade)!
            PersistenceServices.saveContext()
            self.people.append(person)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchRequest : NSFetchRequest<Person> = Person.fetchRequest()
        do {
            let people = try PersistenceServices.context.fetch(fetchRequest)
            self.people = people
            self.tableView.reloadData()
        } catch{}
    }
}

extension ViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = people[indexPath.row].nome
        cell.detailTextLabel?.text = String(people[indexPath.row].idade)
        return cell
    }
}
