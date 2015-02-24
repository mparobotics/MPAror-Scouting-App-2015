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
        let cell = self.tableView.dequeueReusableCellWithIdentifier("LookupCell") as UITableViewCell
        
        var team : Team
        // Check to see whether the normal table or search results table is being displayed and set the Candy object from the appropriate array
        if tableView == self.searchDisplayController!.searchResultsTableView {
            team = filteredTeams[indexPath.row]
        } else {
            team = teams[indexPath.row]
        }
        
        // Configure the cell
        cell.textLabel!.text = String(format: "%d: %@", team.teamNumber, team.teamName)
        if (team.robotImageSet) {
            let image = team.robotImage
            
            let size = CGSizeApplyAffineTransform(image.size, CGAffineTransformMakeScale(0.07, 0.07))
            let hasAlpha = false
            let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
            
            UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
            image.drawInRect(CGRect(origin: CGPointZero, size: size))
            
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            cell.imageView?.image = scaledImage
            cell.imageView?.layer.masksToBounds = true;
            cell.imageView?.layer.cornerRadius = 5.0;
        }
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    func filterContentForSearchText(searchText: String) {
        // Filter the array using the filter method
        self.filteredTeams = self.teams.filter({( team: Team) -> Bool in
            let numberMatch = String(format: "%d", team.teamNumber).rangeOfString(searchText)
            
            let nameMatch = String(format: "%@", team.teamName.uppercaseString).rangeOfString(searchText.uppercaseString)
            
            return numberMatch != nil || nameMatch != nil
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
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "teamLookupDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let controller = segue.destinationViewController as TeamDetail
                controller.teamData = teams[indexPath.row]
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        teams = M_Scout.teams.getTeams() as [Team]
        
        // Reload the table
        self.tableView.reloadData()
    }


}
