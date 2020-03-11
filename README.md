# Address picker 
This is adress picker 

//steps to implement GMSAutocompleteViewController

#### step 1
Add the pod file to your projects
by commmand

your_project_directory:~ machd$ pod init

add the pod to your pod file

 ### pod 'GooglePlaces'
 
#### step 2

 install it by command

your_project_directory:~  machd$ pod install

#### step 3 
go to the App delegate 

#### import GooglePlaces

// Set the Google Place API's autocomplete UI control

GMSPlacesClient.provideAPIKey("Api_key#######")
         
         
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
         // Set the Google Place API's autocomplete UI control
         GMSPlacesClient.provideAPIKey("AIzaSyBK0UW0uFBgRjjb_uV3TFMw4MrsJSdaGC8")
        return true
    }


####  step 4
Go to your ViewController

confrom this protocol

GMSAutocompleteViewControllerDelegate

and add this method and call it in area  from which you want to present address picker


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
    
    


### step 5

and implements these methods to your ViewController

<img src="https://github.com/sunilkr123/AddressPicker/blob/master/attachment/Screenshot%202020-03-11%20at%202.13.59%20PM.png" width="1261" height="495">





<img src="https://raw.githubusercontent.com/sunilkr123/AddressPicker/master/attachment/addressPicker.gif" width="300" height="600">





