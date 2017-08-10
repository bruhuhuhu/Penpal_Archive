//
//  NewViewController.swift
//  Penpal
//
//  Created by hu tsun hao on 6/8/17.
//  Copyright © 2017 hu. All rights reserved.
//

import UIKit

class NewViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var PenPhoto: UIImageView!
    @IBOutlet weak var ManufacturerTF: UITextField!
    @IBOutlet weak var NameTF: UITextField!
    @IBOutlet weak var NibSizeTF: UITextField!
    @IBOutlet weak var DatePurchasedTF: UITextField!
    @IBOutlet weak var PriceTF: UITextField!
    @IBOutlet weak var InkFilledTF: UITextField!
    @IBOutlet weak var DateFilledTF: UITextField!
    
    let DatePicker = UIDatePicker()
    

    
    //initialisation
    var NewPen = Pen (PenPhoto:nil, Manufacturer: "" , Name:"", NibSize: "", DatePurchaseed: "", Price: "", InkFilled: "", DateFilled: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ManufacturerTF.delegate = self
        NameTF.delegate = self
        NibSizeTF.delegate = self
        PriceTF.delegate = self
        DatePurchasedTF.delegate = self
        InkFilledTF.delegate = self
        DateFilledTF.delegate = self
    }
    
    //back button

    @IBAction func backPaseed(_ sender: Any) {
          dismiss(animated: true, completion: nil)
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
    
//functions for segue
    
    @IBAction func savePressed(_ sender: Any) {
        performSegue(withIdentifier: "DetailViewController", sender: NewPen)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailViewController" {
        let nextScene = segue.destination as! DetailViewController
        // Pass the object to the new controller
        nextScene.Pen = NewPen
        }
    }
    
//functions for text fields
    
    
    // date picker for date filled and purchased date
    
    func createDatePicker (_ textField: UITextField) {
        
        
        //format for date
        DatePicker.datePickerMode = .date
        
       
        
        // tool bar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        // bar button item
        
        textField.inputAccessoryView = toolbar
        textField.inputView = DatePicker
            
        if textField == DatePurchasedTF {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done , target: nil, action:#selector(doneDatePurchasedPicker))
        toolbar.setItems([doneButton], animated: false)
        } else if textField == DateFilledTF {
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done , target: nil, action:#selector(doneDateFilledPicker))
            toolbar.setItems([doneButton], animated: false)
        }
        
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
        if textField == self.DateFilledTF{
            createDatePicker(textField)
        
        }
        else if textField == self.DatePurchasedTF{
            createDatePicker(textField)
        
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        NewPen.Manufacturer = ManufacturerTF.text!
        NewPen.Name = NameTF.text!
        NewPen.NibSize = NibSizeTF.text!
        NewPen.DatePurchaseed = DatePurchasedTF.text!
        NewPen.Price = PriceTF.text!
        NewPen.InkFilled = InkFilledTF.text!
        NewPen.DateFilled = DateFilledTF.text!
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()

        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        PriceTF.resignFirstResponder()
    }

   

}
