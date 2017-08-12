//
//  PensTableViewController.swift
//  Penpal
//
//  Created by hu tsun hao on 8/8/17.
//  Copyright © 2017 hu. All rights reserved.
//

import UIKit
import os.log

class PensTableViewController: UITableViewController {
    

    var Pens = [Pen]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // loadSamplePens()

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
            return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Pens.count
    }
    
    // loading samples
    private func loadSamplePens() {
        let photo1 = UIImage(named: "defaultphoto_2x")
        let photo2 = UIImage(named: "lattice")
        let photo3 = UIImage(named: "defaultphoto_2x")
        let pen1 = Pen(PenPhoto: photo1, Manufacturer: "omas", Name: "Paragon", NibSize: "B", DatePurchaseed: "2018/8/8", Price: "550", InkFilled: "Asa Gao", DateFilled: "2018/8/8")
        let pen2 = Pen(PenPhoto: photo2,Manufacturer: "omas", Name: "Paragon", NibSize: "B", DatePurchaseed: "2018/8/8", Price: "550", InkFilled: "Asa Gao", DateFilled: "2018/8/8")
        let pen3 = Pen(PenPhoto: photo3,Manufacturer: "omas", Name: "Paragon", NibSize: "B", DatePurchaseed: "2018/8/8", Price: "550", InkFilled: "Asa Gao", DateFilled: "2018/8/8")
        
        Pens += [pen1, pen2, pen3]
    }
    
    

    //config for table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       

        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "PenTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PenTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        // Fetches the appropriate meal for the data source layout.
        let Pen = Pens[indexPath.row]
        
        cell.PenName.text = Pen.FullName
        cell.DateFilled.text = Pen.DateFilled
        cell.PenPhoto.image = Pen.PenPhoto
        cell.InkFilled.text = Pen.InkFilled
        print (Pen.FullName)
        

        return cell
    }
    
    //unwinding for saving
    
    @IBAction func unwindToPenpal (sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? AddPenViewController, let pen = sourceViewController.pen {
            
            // Add a new pen.
            let newIndexPath = IndexPath(row: Pens.count, section: 0)
            
            Pens.append(pen)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        switch (segue.identifier ?? ""){
        case "AddPen":
            os_log("adding a new pen",  log: OSLog.default, type: .debug)
        case "ShowDetails":
            guard let addPenController = segue.destination as? AddPenViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedPenCell = sender as? PenTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedPenCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedPen = Pens[indexPath.row]
           
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
            
        
        }
        
        
    }
    
    
  
    
}
