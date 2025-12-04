//
//  ViewController.swift
//  FilmSearcherExam
//
//  Created by Mananas on 4/12/25.
//

import UIKit

var result : SearchResult?
var filmList : [Film] = []
var fristFilmList : [Film] = []
var film : Film?
var isFristSearch = true

class MainViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchbar.delegate = self
        getFilms(query: "film")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath) as! FilmViewCell
        let film = filmList[indexPath.row]
        cell.render(film : film)
        return cell
    }
    
    func searchBar(_ searchbar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filmList = fristFilmList
            self.tableView.reloadData()
        } else {
            getFilms(query: searchText)
        }
    }
    
    func getFilms(query: String) {
        Task {
            result = await ServiceApi().getFilms(query: query)
            filmList = result?.films ?? []
            print(filmList)
            DispatchQueue.main.async {
                self.tableView.reloadData()
                if isFristSearch {
                    fristFilmList = filmList
                    isFristSearch = false
                }
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let detailVC = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let film = filmList[indexPath.row]
            detailVC.film = film
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
