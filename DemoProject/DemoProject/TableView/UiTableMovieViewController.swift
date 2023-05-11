//
//  UiTableMovieViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 12/04/23.
//

import UIKit

class UiTableMovieViewController: UIViewController {

    //MARK: - Variables
    var arrMovie = MovieSeriesModel.getAllMovies()
    var arrSeries = MovieSeriesModel.getAllSeries()
    
    //MARK: - Outlets
    @IBOutlet weak var tableMovieView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        tableMovieView.dataSource = self
        tableMovieView.delegate = self
        tableMovieView.isEditing = true
        tableMovieView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieCell")
        tableMovieView.register(UINib(nibName: "SeriesTableViewCell", bundle: nil), forCellReuseIdentifier: "seriesCell")
    }

}

//MARK: - extension datasource
extension UiTableMovieViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return arrMovie.count
        } else {
            return arrSeries.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Movies"
        } else if section == 1 {
            return "Series"
        } else {
            return "NA"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieCell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as? MovieTableViewCell,
              let seriesCell = tableView.dequeueReusableCell(withIdentifier: "seriesCell") as? SeriesTableViewCell else {
            return UITableViewCell()
        }
        
        if indexPath.section == 0 {
            
            let indexOfMovieData = arrMovie[indexPath.row]
            movieCell.configureCell(data: indexOfMovieData)
            
            return movieCell
            
        } else if indexPath.section == 1 {
            
            let indexOfSeriesData = arrSeries[indexPath.row]
            seriesCell.configureCell(data: indexOfSeriesData)
            return seriesCell
        } else {
            return UITableViewCell()
        }
        
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["M","S"]
    }
    
    
}

//MARK: - extension delegate
extension UiTableMovieViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            var indexData = arrMovie[indexPath.row]
            indexData.isSelected = !indexData.isSelected
            arrMovie[indexPath.row] = indexData
            tableView.reloadData()
        } else if indexPath.section == 1 {
            var indexData = arrSeries[indexPath.row]
            indexData.isSelected = !indexData.isSelected
            arrSeries[indexPath.row] = indexData
            tableView.reloadData()
        }
    }
}
