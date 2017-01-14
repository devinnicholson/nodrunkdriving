//
//  DrinkRewardTableViewController.swift
//  nodrunkdriving
//
//  Created by Devin Nicholson on 1/14/17.
//  Copyright © 2017 Sarthak Khillon. All rights reserved.
//

import UIKit

//var curBar: String = String()

class DrinkRewardTableViewController: UITableViewController {
    
    struct Bar {
        var barName: String
        var starNum: Int
        var unlocked: Bool
        
        init( b: String, s: Int, u: Bool) {
            
            barName = b
            starNum = s
            unlocked = u
            
        }
    }
    
    var bars: [Bar] = [Bar(b: "SLO Brew", s: 1, u: true), Bar(b: "Bull's Tavern", s: 4, u: false), Bar(b: "Marston's Bar & Grill", s: 2, u: false), Bar(b: "Creeky Tiki", s: 1, u: true), Bar(b: "Mother's Tavern", s: 3, u: true), Bar(b: "Frog & Peach Pub", s: 4, u: false), Bar(b: "Black Sheep Bar & Grill", s: 3, u: true)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bars.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as!DrinkRewardTableViewCell
        
        cell.barName.text = bars[indexPath.row].barName
        
        let num = bars[indexPath.row].starNum;
        
        if (bars[indexPath.row].unlocked) {
            
            cell.redeemButton.isHidden = false
        }
        
        if (num == 1) {
            cell.star1.isHidden = false
        }
        
        if (num == 2) {
            cell.star2.isHidden = false
        }
        
        if (num == 3) {
            cell.star3.isHidden = false
        }
        
        if (num == 4) {
            cell.star4.isHidden = false
        }
        
        return cell
    }
    
    /*
     override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
     
     curBar = bars[(self.tableView.indexPathForSelectedRow?.row)!].barName
     
     }
     
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
