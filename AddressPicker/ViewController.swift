//
//  ViewController.swift
//  AddressPicker
//
//  Created by Sunil Kumar on 18/02/20.
//  Copyright © 2020 Wiantech. All rights reserved.
//

import UIKit
import GooglePlaces
class ViewController: UIViewController,UITextFieldDelegate ,GMSAutocompleteViewControllerDelegate{

    @IBOutlet weak var txtfAddressPicker: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtfAddressPicker.delegate = self
    }

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
       presentPicker()
    }
    
    
    // Present the Autocomplete view controller when the button is pressed.
    func presentPicker()  {
        
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        
        // Specify the place data types to return.
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
          UInt(GMSPlaceField.placeID.rawValue))!
        autocompleteController.placeFields = fields
        
        // Specify a filter.
        let filter = GMSAutocompleteFilter()
        filter.type = .address//.address
        autocompleteController.autocompleteFilter = filter
        // Display the autocomplete view controller.
        present(autocompleteController, animated: true, completion: nil)
        
    }
    

}

extension ViewController {
    
  // Handle the user's selection.
  func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
    print("address is here \(String(describing: place.name))")
    txtfAddressPicker.text = place.name
    dismiss(animated: true, completion: nil)
  }

  func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
    print("Error: ", error.localizedDescription)
  }

  // User canceled the operation.
  func wasCancelled(_ viewController: GMSAutocompleteViewController) {
    dismiss(animated: true, completion: nil)
  }

  // Turn the network activity indicator on and off again.
  func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
  }

  func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
  }

}

