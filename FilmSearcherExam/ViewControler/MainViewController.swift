//
//  ViewController.swift
//  FilmSearcherExam
//
//  Created by Mananas on 4/12/25.
//

import UIKit

var result : SearchResult?
var filmList : [Film]?
var film : Film?


class MainViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath) as! FilmViewCell
            let film = filmList![indexPath.row]
            cell.render(film : film)
                   return cell
    }
    func getFilms(query: String) {
                Task {
                    result = await ServiceApi().getFilms(query: query)
                    filmList = result?.films
                    print(filmList!)
                    DispatchQueue.main.async {
                        //self.tableView.reloadData()
                    }
                }
                
            }
    func getFilm(query: String) {
                Task {
                    film = await ServiceApi().getFilm(id: query)
                    print(film!)
                    DispatchQueue.main.async {
                        //self.tableView.reloadData()
                    }
                }
                
            }

}

