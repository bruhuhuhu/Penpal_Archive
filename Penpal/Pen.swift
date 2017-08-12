//
//  Pen.swift
//  Penpal
//
//  Created by hu tsun hao on 2/8/17.
//  Copyright © 2017 hu. All rights reserved.
//

import Foundation
import os.log
import UIKit

class Pen : NSObject, NSCoding {
    private var _Manufacturer: String!
    private var _Name: String!
    private var _NibSize: String!
    private var _DatePurchaseed: String!
    private var _Price: String!
    private var _InkFilled: String!
    private var _DateFilled: String!
    var PenPhoto: UIImage?
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("Pens")
    
    struct PropertyKey {
        static let Manufacturer = "Manufacturer"
        static let Name = "Name"
        static let PenPhoto = "PenPhoto"
        static let NibSize = "NibSize"
        static let DatePurchaseed = "DatePurchaseed"
        static let Price = "Price"
        static let InkFilled = "InkFilled"
        static let DateFilled = "DateFiled"
        
    }
    
    
    
    
    init(PenPhoto:UIImage?, Manufacturer: String, Name: String, NibSize: String, DatePurchaseed:String, Price: String, InkFilled:String, DateFilled: String) {
        self.PenPhoto = PenPhoto
        _Manufacturer = Manufacturer
        _Name = Name
        _NibSize = NibSize
        _DatePurchaseed = DatePurchaseed
        _Price = Price
        _InkFilled = InkFilled
        _DateFilled = DateFilled
    }
    
    
    
    var Manufacturer: String {
        get {
        return _Manufacturer
        } set (value) {
        _Manufacturer = value
        }
    }
    
    var Name: String {
        get {
            return _Name
        } set (value) {
        _Name = value
        }
    }
        
    var NibSize: String {
        get{
        return _NibSize
        } set(value){
        _NibSize = value
        }
    }
    
    
    var DatePurchaseed: String {
        get{
        return _DatePurchaseed
        }
        set (value){
        _DatePurchaseed = value
        }
    }
    var Price: String {
        get{
        return _Price
        }set(value){
        _Price = value
        }
    }
    
    var InkFilled: String {
        get{
        return _InkFilled
        }set(value){
        _InkFilled = value
        }
    }
    
    var DateFilled: String {
        get{
        return _DateFilled
        }set(value){
        _DateFilled = value
        }
    }
    
    var FullName: String {
    let FullName = _Manufacturer+" "+_Name
    return FullName
    }
    
    //MARK: NSCoding
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(Name, forKey: PropertyKey.Name)
        aCoder.encode(Manufacturer, forKey: PropertyKey.Manufacturer)
        aCoder.encode(PenPhoto, forKey: PropertyKey.PenPhoto)
        aCoder.encode(Price, forKey: PropertyKey.Price)
        aCoder.encode(DatePurchaseed, forKey: PropertyKey.DatePurchaseed)
        aCoder.encode(InkFilled, forKey: PropertyKey.InkFilled)
        aCoder.encode(DateFilled, forKey: PropertyKey.DateFilled)
        aCoder.encode(NibSize, forKey: PropertyKey.NibSize)
        
    }
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let Name = aDecoder.decodeObject(forKey: PropertyKey.Name) as? String
            
            else {
            os_log("Unable to decode the name for a Pen object.", log: OSLog.default, type: .debug)
            return nil
            }
    
        // Because photo is an optional property of Meal, just use conditional cast.
        let PenPhoto = aDecoder.decodeObject(forKey: PropertyKey.PenPhoto) as? UIImage
        
        let  Manufacturer = aDecoder.decodeObject(forKey: PropertyKey.Manufacturer)
        let  NibSize = aDecoder.decodeObject(forKey: PropertyKey.NibSize)
        let  DatePurchaseed = aDecoder.decodeObject(forKey: PropertyKey.DatePurchaseed)
        let  Price = aDecoder.decodeObject(forKey: PropertyKey.Price)
        let  InkFilled = aDecoder.decodeObject(forKey: PropertyKey.InkFilled)
        let  DateFilled = aDecoder.decodeObject(forKey: PropertyKey.DateFilled)


        
        // Must call designated initializer.
        self.init(PenPhoto:PenPhoto, Manufacturer: Manufacturer as! String, Name: Name, NibSize: NibSize as! String, DatePurchaseed:DatePurchaseed as! String, Price: Price as! String, InkFilled:InkFilled as! String, DateFilled: DateFilled as! String)
    }

}
