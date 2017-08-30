//
//  AirportTableViewController.swift
//  LuckyTask
//
//  Created by Abdalla Odat on 8/31/17.
//  Copyright © 2017 Abdalla Odat. All rights reserved.
//

import UIKit
import PKHUD

class AirportsTableViewController: UITableViewController {
    
    var airports = [Airport]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HUD.flash(.progress)
        ListManager.getAirports { (success, errorMsg , fetchedAirports) in
            if let fetchedAirports = fetchedAirports {
                self.airports = fetchedAirports
                self.tableView?.reloadData()
                HUD.hide()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.airports.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListCustomCell
        let airport = self.airports[indexPath.row]
        cell.thumbnail.af_setImage(withURL:URL(string: airport.thumbnailUrl!)!)
        cell.title.text = airport.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedAirport = self.airports[indexPath.row]
        UserDefaults.standard.set(selectedAirport.name, forKey: "airportName")
        UserDefaults.standard.set(selectedAirport.thumbnailUrl, forKey: "airportImage")
        UserDefaults.standard.synchronize()
        pushToHomeScreen()
    }
    
    func pushToHomeScreen(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let home = storyBoard.instantiateViewController(withIdentifier: "Home") as! ViewController
        home.showSelected = true
        self.navigationController?.pushViewController(home, animated: true)
    }
    
    
}
