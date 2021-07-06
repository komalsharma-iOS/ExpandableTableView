//
//  ViewController.swift
//  ExpandableTableview
//
//  Created by iApp on 06/07/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    @IBOutlet weak var dataTableview: UITableView!
    var expandedcells = [Int]()
    let dataList = ["fdsdfsdfsdf","fjhbehwfbwehbfjwhebfhjwbefhjbwejhfbjwehbfjhewbfjhwefhwebfjhwebfjhwebfhbewjfhbewjhfjhwebfjhwebfjhwejhbfjwehfbhjwefjhwebfjhwejhfhjwebfjhwebfjhbewfbhewhbfhwebfhwebfhbwehbfhwebfhwebfhbwehfbwehfbjhwebfjhwbefbhwejhbfwjhebfjwhebfjwhbehjwbeffjhbehwfbwehbfjwhebfhjwbefhjbwejhfbjwehbfjhewbfjhwefhwebfjhwebfjhwebfhbewjfhbewjhfjhwebfjhwebfjhwejhbfjwehfbhjwefjhwebfjhwejhfhjwebfjhwebfjhbewfbhewhbfhwebfhwebfhbwehbfhwebfhwebfhbwehfbwehfbjhwebfjhwbefbhwejhbfwjhebfjwhebfjwhbehjwbeffjhbehwfbwehbfjwhebfhjwbefhjbwejhfbjwehbfjhewbfjhwefhwebfjhwebfjhwebfhbewjfhbewjhfjhwebfjhwebfjhwejhbfjwehfbhjwefjhwebfjhwejhfhjwebfjhwebfjhbewfbhewhbfhwebfhwebfhbwehbfhwebfhwebfhbwehfbwehfbjhwebfjhwbefbhwejhbfwjhebfjwhebfjwhbehjwbeffjhbehwfbwehbfjwhebfhjwbefhjbwejhfbjwehbfjhewbfjhwefhwebfjhwebfjhwebfhbewjfhbewjhfjhwebfjhwebfjhwejhbfjwehfbhjwefjhwebfjhwejhfhjwebfjhwebfjhbewfbhewhbfhwebfhwebfhbwehbfhwebfhwebfhbwehfbwehfbjhwebfjhwbefbhwejhbfwjhebfjwhebfjwhbehjwbef", "fjhbehwfbwehbfjwhebfhjwbefhjbwejhfbjwehbfjhewbfjhwefhwebfjhwebfjhwebfhbewjfhbewjhfjhwebfjhwebfjhwejhbfjwehfbhjwefjhwebfjhwejhfhjwebfjhwebfjhbewfbhewhbfhwebfhwebfhbwehbfhwebfhwebfhbwehfbwehfbjhwebfjhwbefbhwejhbfwjhebfjwhebfjwhbehjwbef","fjhbehwfbwehbfjwhebfhjwbefhjbwejhfbjwehbfjhewbfjhwefhwebfjhwebfjhwebfhbewjfhbewjhfjhwebfjhwebfjhwejhbfjwehfbhjwefjhwebfjhwejhfhjwebfjhwebfjhbewfbhewhbfhwebfhwebfhbwehbfhwebfhwebfhbwehfbwehfbjhwebfjhwbefbhwejhbfwjhebfjwhebfjwhbehjwbeffjhbehwfbwehbfjwhebfhjwbefhjbwejhfbjwehbfjhewbfjhwefhwebfjhwebfjhwebfhbewjfhbewjhfjhwebfjhwebfjhwejhbfjwehfbhjwefjhwebfjhwejhfhjwebfjhwebfjhbewfbhewhbfhwebfhwebfhbwehbfhwebfhwebfhbwehfbwehfbjhwebfjhwbefbhwejhbfwjhebfjwhebfjwhbehjwbeffjhbehwfbwehbfjwhebfhjwbefhjbwejhfbjwehbfjhewbfjhwefhwebfjhwebfjhwebfhbewjfhbewjhfjhwebfjhwebfjhwejhbfjwehfbhjwefjhwebfjhwejhfhjwebfjhwebfjhbewfbhewhbfhwebfhwebfhbwehbfhwebfhwebfhbwehfbwehfbjhwebfjhwbefbhwejhbfwjhebfjwhebfjwhbehjwbeffjhbehwfbwehbfjwhebfhjwbefhjbwejhfbjwehbfjhewbfjhwefhwebfjhwebfjhwebfhbewjfhbewjhfjhwebfjhwebfjhwejhbfjwehfbhjwefjhwebfjhwejhfhjwebfjhwebfjhbewfbhewhbfhwebfhwebfhbwehbfhwebfhwebfhbwehfbwehfbjhwebfjhwbefbhwejhbfwjhebfjwhebfjwhbehjwbeffjhbehwfbwehbfjwhebfhjwbefhjbwejhfbjwehbfjhewbfjhwefhwebfjhwebfjhwebfhbewjfhbewjhfjhwebfjhwebfjhwejhbfjwehfbhjwefjhwebfjhwejhfhjwebfjhwebfjhbewfbhewhbfhwebfhwebfhbwehbfhwebfhwebfhbwehfbwehfbjhwebfjhwbefbhwejhbfwjhebfjwhebfjwhbehjwbeffjhbehwfbwehbfjwhebfhjwbefhjbwejhfbjwehbfjhewbfjhwefhwebfjhwebfjhwebfhbewjfhbewjhfjhwebfjhwebfjhwejhbfjwehfbhjwefjhwebfjhwejhfhjwebfjhwebfjhbewfbhewhbfhwebfhwebfhbwehbfhwebfhwebfhbwehfbwehfbjhwebfjhwbefbhwejhbfwjhebfjwhebfjwhbehjwbef"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dataTableview.dequeueReusableCell(withIdentifier: "DataTableViewCell") as? DataTableViewCell else{ return UITableViewCell()}
        cell.dataLbl.text = dataList[indexPath.row]
        
        
        if expandedcells.contains(indexPath.row){
            cell.dataLbl.numberOfLines = 0
        }
        else{
            cell.dataLbl.numberOfLines = 3
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if expandedcells.contains(indexPath.row){
            expandedcells.remove(at: expandedcells.firstIndex(of: indexPath.row) ?? -1)
        }
        else{
            expandedcells.append(indexPath.row)
        }
        dataTableview.reloadRows(at: [indexPath], with: .automatic)
    }

}

