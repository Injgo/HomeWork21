//
//  DetailViewController.swift
//  HomeWork21
//
//  Created by Dato on 11.08.22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var country: Country!
    
    
    @IBOutlet private weak var countryTextLabel: UILabel!
    @IBOutlet private weak var capitalTextLabel: UILabel!
    @IBOutlet private weak var populationTextLabel: UILabel!
    @IBOutlet private weak var imageFlag: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    private func configure() {
        countryTextLabel.text = country.name
        capitalTextLabel.text = country.capital
        populationTextLabel.text = "\(country.population)"
        imageFlag.load(url: country.flags.png)
    }

  

}
