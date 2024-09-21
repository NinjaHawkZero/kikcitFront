//
//  ViewModelsBusiness.swift
//  kikcitFinal
//
//  Created by Marcus Westbrooks on 9/19/24.
//

import Foundation
import MapKit
import CoreLocation
class CreateBusinessVM: ObservableObject {
    
    @Published var image: UIImage?
   // @Published var imagesArray: [UIImage] = []
    @Published var profileImage = ""
    @Published var businessName: String = ""
    @Published var userID = ""
    @Published var businessAddress: String = ""
    @Published var businessType: String = ""
    @Published var businessPhone: String = ""
    @Published var businessWebsite: String = ""
    @Published var businessHours: BusinessHours = BusinessHours(Mon: "", Tue: "", Wed: "", Thurs: "", Fri: "", Sat: "", Sun: "")
    @Published var businessAbout: String = ""
    @Published var kikcitPoints = 0
    @Published var consumerCategory: String = ""
    @Published var localRecommendationCategory = ""
    @Published var latitude = 37.7683828
    @Published var longitude = -122.4210163
    @Published var id = ""
    @Published var didCreateBusiness = false
    

    
    func businessUpload() async {
        
       
        let newBusiness =
        Business(didCreateBusiness: didCreateBusiness, profileImage: profileImage, businessName: businessName, userID: userID, businessAddress: businessAddress, businessType: businessType, businessPhone: businessPhone, businessWebsite: businessWebsite, businessHours: businessHours, businessAbout: businessAbout, kikcitPoints: kikcitPoints, consumerCategory: consumerCategory, localRecommendationCategory: localRecommendationCategory, latitude: latitude , longitude: longitude, id: id)
        
        print(newBusiness)
        Webservice().uploadBusiness(business: newBusiness, completion:
        { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    print("from businessupload:\(response.business)")
                    defaults.removeObject(forKey: "businessID")
                    
                    self.businessName = response.business.businessName
                    self.businessPhone = response.business.businessPhone
                    self.businessAbout = response.business.businessAbout
                    self.consumerCategory = response.business.consumerCategory
                    self.businessHours = response.business.businessHours
                    self.businessWebsite = response.business.businessWebsite
                    self.userID = response.business.userID
                    self.businessAddress = response.business.businessAddress
                    self.longitude = response.business.longitude
                    self.latitude = response.business.latitude
                    self.profileImage = response.business.profileImage
                    self.id = response.business.id
                    self.didCreateBusiness = response.business.didCreateBusiness
                    self.kikcitPoints = response.business.kikcitPoints
                    self.businessType = response.business.businessType
                    self.localRecommendationCategory = response.business.localRecommendationCategory
                    
                    defaults.set(response.business.id, forKey: "businessID")
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error)
                }
            }
        })
    }
    
    
    func uploadImage()
    { Webservice().uploadImage(fileName: "file",
                               image: self.image ?? UIImage(), userID: userID) { result in
            switch result {
            case.success(let response):
                DispatchQueue.main.async {
                    print("from imageUpload:\(response.business)")
                    self.businessName = response.business.businessName
                    self.businessPhone = response.business.businessPhone
                    self.businessAbout = response.business.businessAbout
                    self.businessType = response.business.businessType
                    self.businessHours = response.business.businessHours
                    self.businessWebsite = response.business.businessWebsite
                    self.userID = response.business.userID
                    self.businessAddress = response.business.businessAddress
                    self.longitude = response.business.longitude
                    self.latitude = response.business.latitude
                    self.profileImage = response.business.profileImage
                    defaults.removeObject(forKey: "businessID")
                    defaults.set(response.business.id, forKey: "businessID")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    // Assign GPS Coordinates from address string
    func forwardGeocodingLat(address: String ) async {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address, completionHandler: { (placemarks, error) in
            if error != nil {
                print("Failed to retrieve location")
                return
            }
            var location: CLLocation?
            if let placemarks = placemarks, placemarks.count > 0 {
                location = placemarks.first?.location
            }
            if let location = location {
                let coordinate = location.coordinate
                print("\nlat: \(coordinate.latitude), long: \(coordinate.longitude)")
                self.latitude = coordinate.latitude
                self.longitude = coordinate.longitude
               print("below are the coordinates")
                print(self.latitude)
                print(self.longitude)
            } else {
                print("No Matching Location Found")
            }
        })
        
       
        
    }
    // Generate url to link to maps
    func openMaps(latitude: Double?, longitude: Double?) {
        //Use guard statement here for optionals
        
        guard let latitude = latitude else {
            print("no latitude")
            return
        }
        
        guard let longitude = longitude else {
            print("not longitude")
            return
        }
        let url = URL(string: "maps://?saddr=&daddr=\(latitude),\(longitude)")

        if UIApplication.shared.canOpenURL(url!) {
            print("the url for the maps:\(String(describing: url))")
            UIApplication.shared.open(url!,
                                      options: [:], completionHandler: nil)
        }

    }
}
