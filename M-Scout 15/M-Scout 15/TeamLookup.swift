//
//  TeamLookup.swift
//  M-Scout 15
//
//  Created by Brendan Boyle on 2/23/15.
//  Copyright (c) 2015 FRC: Team 3926. All rights reserved.
//

import UIKit

class TeamLookup: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    var teams = [Team]()
    var filteredTeams = [Team]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        teams = M_Scout.teams.teamList as [Team]
        
        // Reload the table
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.filteredTeams.count
        } else {
            return self.teams.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //ask for a reusable cell from the tableview, the tableview will create a new one if it doesn't have any
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        var team : Team
        // Check to see whether the normal table or search results table is being displayed and set the Candy object from the appropriate array
        if tableView == self.searchDisplayController!.searchResultsTableView {
            team = filteredTeams[indexPath.row]
        } else {
            team = teams[indexPath.row]
        }
        
        // Configure the cell
        cell.textLabel!.text = String(format: "%d: %@", team.teamNumber, team.teamName)
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    func filterContentForSearchText(searchText: String) {
        // Filter the array using the filter method
        self.filteredTeams = self.teams.filter({( team: Team) -> Bool in
            let stringMatch = String(format: "%d", team.teamNumber).rangeOfString(searchText)
            return stringMatch != nil
        })
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText(searchString)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text)
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
