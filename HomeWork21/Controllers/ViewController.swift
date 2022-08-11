//
//  ViewController.swift
//  HomeWork21
//
//  Created by Dato on 11.08.22.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var countryArray = [Country]()
    var filteredData = [Country]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search"
        
        listTableView.delegate = self
        listTableView.dataSource = self
        searchBar.delegate = self
        fetchData()
        
        
    }
  
    
    private func fetchData(){
        indicator.startAnimating()
        indicator.alpha = 1
        APICaller.shared.getData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self?.countryArray = model
                case .failure(let error):
                    print(error.localizedDescription)
                }
                self?.indicator.stopAnimating()
                self?.indicator.alpha = 0
                self?.listTableView.reloadData()
                
            }
        }
    }
    
}





extension ViewController : UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredData.isEmpty ? countryArray.count : filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CutomCell

        
        let currentCounty =  filteredData.isEmpty ?  countryArray[indexPath.row] : filteredData[indexPath.row]
        

        cell.name.text = currentCounty.name
        cell.alphaCode.text = currentCounty.alpha2Code
        cell.flagImg.load(url: currentCounty.flags.png)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        let county = filteredData.isEmpty ? countryArray[indexPath.row] : filteredData[indexPath.row]
        vc.country = county
        navigationController?.pushViewController(vc, animated: true)
       
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
}


extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData.removeAll()
        
        if searchText == "" {
            filteredData = countryArray
        }
        else {
            for data in countryArray {
                if data.name.lowercased().contains(searchText.lowercased()){
                    filteredData.append(data)
                }
            }
            
        }
        self.listTableView.reloadData()
    }
}



