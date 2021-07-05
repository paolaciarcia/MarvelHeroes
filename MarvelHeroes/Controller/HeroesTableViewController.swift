//
//  HeroesTableViewController.swift
//  MarvelHeroes
//
//  Created by Erick Borges on 02/07/21.
//

import UIKit

class HeroesTableViewController: UITableViewController {
    
    //MARK: - Properties
    var heroes: [Hero] = []
    var name: String?
    var loadingHeroes: Bool = false
    var currentPage: Int = 0
    var total: Int = 0
    
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Arial", size: 20)
        return label
    }()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        label.text = "Looking for heroes, wait..."
        loadHeroes()
    }
    
    //MARK: - Methods
    func loadHeroes() {
        loadingHeroes = true
        APIHeros.loadHeros(name: name, page: currentPage) { (info) in
            if let info = info {
                self.heroes += info.data.results
                self.total = info.data.total ?? self.total
                print("Total: \(self.total), Já incluídos: \(self.heroes.count)")
                DispatchQueue.main.async {
                    if self.heroes.count < 1 {
                        self.label.text = "We did not find any heroes with the name \(self.name!)"
                    }
                    self.loadingHeroes = false
                    self.tableView.reloadData()
                }
            }
        }
    }
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = heroes.count == 0 ? label : nil
        return heroes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroTableViewCell
        let hero = heroes[indexPath.row]
        cell.prepareCell(with: hero)

        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showHero", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? HeroViewController else { return }
        vc.hero = heroes[tableView.indexPathForSelectedRow!.row]
    }
    
    //infinitive scroll
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == heroes.count - 10 && !loadingHeroes && heroes.count != total {
            currentPage += 1
            loadHeroes()
        }
    }
}


