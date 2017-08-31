//
//  CountriesTableViewController.swift
//  LuckyTask
//
//  Created by Abdalla Odat on 8/30/17.
//  Copyright © 2017 Abdalla Odat. All rights reserved.
//

import UIKit
import AlamofireImage
import PKHUD

class CountriesTableViewController: UITableViewController {
    
    var countries = [Country]()
    var country:Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HUD.flash(.progress)
        ListManager.getCountries { (success, errorMsg , fetchedCountries) in
            if let fetchedCountries = fetchedCountries {
                self.countries = fetchedCountries
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
        return self.countries.count
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListCustomCell
        let country = self.countries[indexPath.row]
        
        cell.thumbnail.af_setImage(withURL:URL(string: country.thumbnailUrl!)!)
        cell.title.text = country.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = self.countries[indexPath.row]
        self.country = selectedCountry
        performSegue(withIdentifier: "goAirport", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goAirport" {
            let airportVC = segue.destination as! AirportsTableViewController
            airportVC.selectedCountry = self.country
        }
    }
    
}
