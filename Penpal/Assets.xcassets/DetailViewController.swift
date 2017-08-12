//
//  DetailViewController.swift
//  Penpal
//
//  Created by hu tsun hao on 6/8/17.
//  Copyright © 2017 hu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var ManufacturerLbl: UILabel!
    @IBOutlet weak var NameLbl: UILabel!
    @IBOutlet weak var NibSizeLbl: UILabel!
    @IBOutlet weak var DatePurchasedLbl: UILabel!
    @IBOutlet weak var PriceLbl: UILabel!
    @IBOutlet weak var InkFilledLbl: UILabel!
    @IBOutlet weak var DateFilledLbl: UILabel!
    
    private var _Pen:Pen!
    
    var Pen: Pen {
        get{
            return _Pen
        }set {
            _Pen = newValue
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ManufacturerLbl.text = Pen.Manufacturer
        NameLbl.text = Pen.Name
        NibSizeLbl.text = Pen.NibSize
        DatePurchasedLbl.text = Pen.DatePurchaseed
        PriceLbl.text = Pen.Price
        InkFilledLbl.text = Pen.InkFilled
        DateFilledLbl.text = Pen.DateFilled

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backPressed(_ sender: UIButton) {
            dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
