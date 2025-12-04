//
//  DetailViewController.swift
//  FilmSearcherExam
//
//  Created by Mananas on 4/12/25.
//

import UIKit

class DetailViewController: UIViewController {

    // Outlets you can connect in Interface Builder to show details.
    @IBOutlet weak var posterImageView: UIImageView?
    @IBOutlet weak var yearLabel: UILabel?
    @IBOutlet weak var typeLabel: UILabel?
    @IBOutlet weak var genreLabel: UILabel?
    @IBOutlet weak var directorLabel: UILabel?
    @IBOutlet weak var plotLabel: UITextView?

    var film: Film!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = film.title
        getFilm(query: film.id)
    }

    func loadData() {
        yearLabel?.text = film.year
        typeLabel?.text = film.type
        genreLabel?.text = film.genre
        directorLabel?.text = film.director
        plotLabel?.text = film.plot
        posterImageView?.loadFrom(url: film.poster)
        
        
    }
    
    func getFilm(query: String) {
                Task {
                    film = await ServiceApi().getFilm(id: query)
                    DispatchQueue.main.async {
                        self.loadData()
                    }
                }
                
            }
}
