//
//  Pen.swift
//  Penpal
//
//  Created by hu tsun hao on 2/8/17.
//  Copyright © 2017 hu. All rights reserved.
//

import Foundation
import UIKit

class Pen {
    private var _Manufacturer: String!
    private var _Name: String!
    private var _NibSize: String!
    private var _DatePurchaseed: String!
    private var _Price: String!
    private var _InkFilled: String!
    private var _DateFilled: String!
    var PenPhoto: UIImage?
    
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
    let FullName = "\(_Manufacturer) \(_Name)"
    return FullName
    }
}
