//
//  UiTableMovieViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 12/04/23.
//

import UIKit

class UiTableMovieViewController: UIViewController {

    
    var arrMovie = MovieModel.getAllMovies()
    var arrSeries = SereisModel.getAllSeries()
    
    //MARK: - Outlets
    @IBOutlet weak var tableMovieView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableMovieView.dataSource = self
        tableMovieView.delegate = self
        tableMovieView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieCell")
        tableMovieView.register(UINib(nibName: "SeriesTableViewCell", bundle: nil), forCellReuseIdentifier: "seriesCell")
        
        // Do any additional setup after loading the view.
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
        guard let movieCell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        guard let seriesCell = tableView.dequeueReusableCell(withIdentifier: "seriesCell") as? SeriesTableViewCell else {
            return UITableViewCell()
        }
        
        if indexPath.section == 0 {
            
            let indexOfMovieData = arrMovie[indexPath.row]
            movieCell.configCell(data: indexOfMovieData)
            
            return movieCell
            
        } else if indexPath.section == 1 {
            
            let indexOfSeriesData = arrSeries[indexPath.row]
            seriesCell.configSereisCell(data: indexOfSeriesData)
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
            
            let indexData = arrMovie[indexPath.row]
            indexData.isSelected = !indexData.isSelected
            arrMovie[indexPath.row] = indexData
            tableView.reloadData()
//            if let movieCell = tableView.cellForRow(at: indexPath) as? MovieTableViewCell {
//                let indexOfMovieData = arrMovie[indexPath.row]
//                movieCell.configCell(data: indexOfMovieData)
//            }

            
        } else if indexPath.section == 1 {
            
            let indexData = arrSeries[indexPath.row]
            indexData.isSelected = !indexData.isSelected
            arrSeries[indexPath.row] = indexData
            tableView.reloadData()
            
//            if let seriesCell = tableView.cellForRow(at: indexPath) as? SeriesTableViewCell {
//                let indexOfSeriesData = arrSeries[indexPath.row]
//                seriesCell.configSereisCell(data: indexOfSeriesData)
//            }

        }
        
    }
    
}
