//
//  ViewController.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 17/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

// MARK: - Constants
private let sampleCellIdentifier = "sampleCell"

class ViewController: UITableViewController {
    
    // MARK: - Properties
    let architectures: [Architecture] = Architecture.list
}

// MARK: - TableView
extension ViewController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return architectures.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return architectures[section].name
    }
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return architectures[section].samples.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: sampleCellIdentifier,
                                                 for: indexPath)
        
        let sample = architectures[indexPath.section].samples[indexPath.row]
        cell.textLabel?.text = sample.name
        return cell
    }
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        
        let sample = architectures[indexPath.section].samples[indexPath.row]
        if let coordinator = sample.coordinator() {
            coordinator.start(from: self)
            return
        }
        
        displayError(error: UnimplementedArchitectureError())
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Errors
struct UnimplementedArchitectureError: LocalizedError {
    var errorDescription: String? = "Architecture Sample not implemented yet"
}
