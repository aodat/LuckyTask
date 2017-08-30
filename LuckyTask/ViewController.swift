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
    
    @IBOutlet weak var selectedCountry: UILabel!
    @IBOutlet weak var selectedAirport: UILabel!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var airportImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefault = UserDefaults.standard
        if showSelected == true {
            selectedCountry.text = userDefault.string(forKey: "countryName")
            selectedAirport.text = userDefault.string(forKey: "airportName")
            countryImage.af_setImage(withURL:URL(string: userDefault.string(forKey: "countryImage")!)!)
            airportImage.af_setImage(withURL:URL(string: userDefault.string(forKey: "airportImage")!)!)
        }
    }

}

