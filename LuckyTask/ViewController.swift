//
//  ViewController.swift
//  LuckyTask
//
//  Created by Abdalla Odat on 8/30/17.
//  Copyright © 2017 Abdalla Odat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var showSelected = false
    var country: Country?
    var airport: Airport?
    
    @IBOutlet weak var selectedCountry: UILabel!
    @IBOutlet weak var selectedAirport: UILabel!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var airportImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if showSelected == true {
            selectedCountry.text = self.country?.name
            selectedAirport.text = self.airport?.name
            countryImage.af_setImage(withURL:URL(string: (self.country?.thumbnailUrl!)!)!)
            airportImage.af_setImage(withURL:URL(string: (self.airport?.thumbnailUrl!)!)!)
        }
    }

}

