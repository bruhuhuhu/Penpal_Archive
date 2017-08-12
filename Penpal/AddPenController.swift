//
//  NewViewController.swift
//  Penpal
//
//  Created by hu tsun hao on 6/8/17.
//  Copyright © 2017 hu. All rights reserved.
//

import UIKit
import os.log

class AddPenViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var PenPhoto: UIImageView!
    @IBOutlet weak var ManufacturerTF: UITextField!
    @IBOutlet weak var NameTF: UITextField!
    @IBOutlet weak var NibSizeTF: UITextField!
    @IBOutlet weak var DatePurchasedTF: UITextField!
    @IBOutlet weak var PriceTF: UITextField!
    @IBOutlet weak var InkFilledTF: UITextField!
    @IBOutlet weak var DateFilledTF: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    let DatePicker = UIDatePicker()
    
     // Enable the Save button only if the text field has a valid Meal name.
 
    

    
    //initialisation
    
    var pen: Pen?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ManufacturerTF.delegate = self
        NameTF.delegate = self
        NibSizeTF.delegate = self
        PriceTF.delegate = self
        DatePurchasedTF.delegate = self
        InkFilledTF.delegate = self
        DateFilledTF.delegate = self
        
        if let pen = pen {
            ManufacturerTF.text = pen.Manufacturer 
            NameTF.text = pen.Name
            NibSizeTF.text = pen.NibSize
            PriceTF.text = pen.Price
            DatePurchasedTF.text = pen.DatePurchaseed
            InkFilledTF.text = pen.InkFilled
            DateFilledTF.text = pen.DateFilled
            PenPhoto.image = pen.PenPhoto
            navigationItem.title = pen.FullName
        }
        
        updateSaveButtonState()
        
    }
    
    
    //back button
    
    
    
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddPenMode = presentingViewController is UINavigationController
        
        if isPresentingInAddPenMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The MealViewController is not inside a navigation controller.")
        }
        
         dismiss(animated: true, completion: nil)
    }

    

    

// functions for segue saving
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let manufacturer = ManufacturerTF.text!
        let name = NameTF.text!
        let nibSize = NibSizeTF.text!
        let datePurchaseed = DatePurchasedTF.text!
        let price = PriceTF.text!
        let inkFilled = InkFilledTF.text!
        let dateFilled = DateFilledTF.text!
        let penPhoto = self.PenPhoto.image
        
        pen = Pen(PenPhoto: penPhoto, Manufacturer: manufacturer, Name: name, NibSize: nibSize, DatePurchaseed: datePurchaseed, Price: price, InkFilled: inkFilled, DateFilled: dateFilled)
      
    }
    
    
   
    
    private func updateSaveButtonState() {
        let Manufacturer = ManufacturerTF.text ?? ""
        let Name = NameTF.text ?? ""
        let NibSize = NibSizeTF.text ?? ""
//        let DatePurchaseed = DatePurchasedTF.text ?? ""
//        let Price = PriceTF.text ?? ""
//        let InkFilled = InkFilledTF.text ?? ""
//        let DateFilled = DateFilledTF.text ?? ""
        saveButton.isEnabled = !Manufacturer.isEmpty && !Name.isEmpty && !NibSize.isEmpty
    
    }
    

    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        pen?.Manufacturer = ManufacturerTF.text!
        pen?.Name = NameTF.text!
        pen?.NibSize = NibSizeTF.text!
        pen?.DatePurchaseed = DatePurchasedTF.text!
        pen?.Price = PriceTF.text!
        pen?.InkFilled = InkFilledTF.text!
        pen?.DateFilled = DateFilledTF.text!
    }
    
//functions for text fields and image
    
    
    // date picker for date filled and purchased date
    
    func createDatePicker (_ textField: UITextField) {
        
        
        //format for date
        DatePicker.datePickerMode = .date
        // tool bar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        // bar button item
        
        textField.inputAccessoryView = toolbar
        textField.inputView = DatePicker
        
        
        if (textField == DatePurchasedTF) {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done , target: nil, action:#selector(doneDatePurchasedPicker))
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(cancelDatePurchasedPicker))
            toolbar.setItems([cancelButton,space,doneButton], animated: false)
        }
        
        else if (textField == DateFilledTF) {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done , target: nil, action:#selector(doneDateFilledPicker))
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(cancelDateFilledPicker))
        toolbar.setItems([cancelButton,space,doneButton], animated: false)
        }
        
        
        
        
    }
    
    @IBAction func cancelDatePurchasedPicker(){
       DatePurchasedTF.text = ""
        DatePurchasedTF.resignFirstResponder()
    }
    @IBAction func cancelDateFilledPicker(){
        DateFilledTF.text = ""
        DateFilledTF.resignFirstResponder()
    }
    
    
    
    
 
    @IBAction func doneDatePurchasedPicker (){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        DatePurchasedTF.text =  dateFormatter.string(from: DatePicker.date)
        DatePurchasedTF.resignFirstResponder()
        
    }
    
    @IBAction func doneDateFilledPicker (){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        DateFilledTF.text = dateFormatter.string(from: DatePicker.date)
        DateFilledTF.resignFirstResponder()
        
    }
    
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
        
        if textField == self.DateFilledTF{
            createDatePicker(textField)
        
        }
        else if textField == self.DatePurchasedTF{
            createDatePicker(textField)
        
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        PriceTF.resignFirstResponder()
    }
    
    
//functions for image picker
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        // UIImagePickerController is a view controller that lets a user pick media
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        
        // option menu
        
        let OptionMenu = UIAlertController(title: "Image Source", message: "Choose camera or photo library", preferredStyle: .actionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            OptionMenu.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action:UIAlertAction) in imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }))
        }
        
        
        OptionMenu.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(action:UIAlertAction) in imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        OptionMenu.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(OptionMenu, animated: true, completion: nil)
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        PenPhoto.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    


   

}
