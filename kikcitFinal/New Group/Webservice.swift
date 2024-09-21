//
//  Webservice.swift
//  kikcitFinal
//
//  Created by Marcus Westbrooks on 9/17/24.
//


import SwiftUI


class Webservice {
    
    
    //Submit user quiz
    func submitUserQuiz(user:User, completion: @escaping (Result<UserLoginResponse, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "http://localhost:3001/kikcit/quizSubmit") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        let body = User( name: user.name, userID: user.userID, deviceToken: user.deviceToken, businessID: user.businessID, kikcitPoints: user.kikcitPoints, consumerCategory: user.consumerCategory, consumerPersona: user.consumerPersona, userType: user.userType, didCompleteQuiz: user.didCompleteQuiz )
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        URLSession.shared.dataTask(with: request) {(data, _, error) in
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: error?.localizedDescription ?? "failed to authenticate user")))
                return
            }
            do {
                let loginResponse = try JSONDecoder().decode(UserLoginResponse.self, from: data)
                completion(.success(loginResponse))
            } catch {
                print(error)
                completion(.failure(.decodingError(error)))
            }
        }.resume()
        
    }
    
    
    
    //User Registration
    func registerUser( user:User, completion: @escaping (Result<UserLoginResponse, AuthenticationError>) -> Void) {
        guard let url = URL(string: "http://localhost:3001/kikcit/userRegister") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        let body = User( name: user.name, userID: user.userID, deviceToken: user.deviceToken, businessID: user.businessID, kikcitPoints: user.kikcitPoints, consumerCategory: user.consumerCategory, consumerPersona: user.consumerPersona, userType: user.userType, didCompleteQuiz: user.didCompleteQuiz )
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        URLSession.shared.dataTask(with: request) {(data, _, error) in
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: error?.localizedDescription ?? "failed to authenticate user")))
                return
            }
            do {
                let loginResponse = try JSONDecoder().decode(UserLoginResponse.self, from: data)
                completion(.success(loginResponse))
            } catch {
                print(error)
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
    
    
    //Business User Registration
    func registerBusinessUser( businessUser:BusinessUser, completion: @escaping (Result<businessUserLoginResponse, AuthenticationError>) -> Void) {
        guard let url = URL(string: "http://localhost:3001/kikcit/businessUserRegister") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        let body = BusinessUser(name: businessUser.name, userID: businessUser.userID, deviceToken: businessUser.deviceToken, businessID: businessUser.businessID, userType: businessUser.userType)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        URLSession.shared.dataTask(with: request) {(data, _, error) in
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: error?.localizedDescription ?? "failed to authenticate user")))
                return
            }
            do {
                let loginResponse = try JSONDecoder().decode(businessUserLoginResponse.self, from: data)
                completion(.success(loginResponse))
            } catch {
                print(error)
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
    
    
    
    //Login User  with Apple
    func loginWithAppleUser(userID: String, completion: @escaping (Result<UserLoginResponse, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "http://localhost:3001/kikcit/userLogin" ) else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        let token = defaults.string(forKey: "token")
        let body = SignInWithAppleRequest(userID: userID, deviceToken: token ?? "Device token not given")
        print("this is the request body:\(body)")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        // let data = try? await URLSession.shared.dataTask(with: request)
        URLSession.shared.dataTask(with: request) {(data, _, error) in
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: error?.localizedDescription ?? "failed to retrieve user")))
                return
            }
            do {
                let loginResponse = try JSONDecoder().decode(UserLoginResponse.self, from: data)
                completion(.success(loginResponse))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
    
    
    
    //Login Business User with Apple
    func loginWithApplebusinessUser(userID: String, completion: @escaping (Result<businessUserLoginResponse, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "http://localhost:3001/kikcit/businessUserLogin" ) else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        let token = defaults.string(forKey: "token")
        let body = SignInWithAppleRequest(userID: userID, deviceToken: token ?? "Device token not given")
        print("this is the request body:\(body)")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        // let data = try? await URLSession.shared.dataTask(with: request)
        URLSession.shared.dataTask(with: request) {(data, _, error) in
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: error?.localizedDescription ?? "failed to retrieve user")))
                return
            }
            do {
                let loginResponse = try JSONDecoder().decode(businessUserLoginResponse.self, from: data)
                completion(.success(loginResponse))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
    
    
    //Upload Business Data from businessUser
    func uploadBusiness( business: Business, completion: @escaping (Result<BusinessResponse, Error>) -> Void) {
        // First, upload the image
        // Image uploaded successfully, now create the business with the image URL
        let body = Business(didCreateBusiness: business.didCreateBusiness, profileImage: business.profileImage, businessName: business.businessName, userID: business.userID, businessAddress: business.businessAddress, businessType: business.businessType, businessPhone: business.businessPhone, businessWebsite: business.businessWebsite, businessHours: business.businessHours, businessAbout: business.businessAbout, kikcitPoints: business.kikcitPoints, consumerCategory: business.consumerCategory, localRecommendationCategory: business.localRecommendationCategory, latitude: business.latitude, longitude: business.longitude, id: business.id)
        // Create URL
        guard let url = URL(string: "http://localhost:3001/kikcit/createBusiness") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            do {
                let businessResponse = try JSONDecoder().decode(BusinessResponse.self, from: data)
                completion(.success(businessResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    
    
    func uploadImage(fileName: String, image: UIImage, userID: String,
                     completion: @escaping (Result<BusinessResponse, Error>) -> Void) {
        print("this is the userID:\(userID)")
        let url = URL(string: "http://localhost:3001/kikcit/imageUpload/\(userID)")
        let boundary = UUID().uuidString
        let session = URLSession.shared
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        var data = Data()
        // Add the image data to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        let paramName = "file"
        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.pngData() ?? Data())
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        session.uploadTask(with: urlRequest, from: data, completionHandler: { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            print(String(decoding: data, as: UTF8.self))
            do {
                let loginResponse = try JSONDecoder().decode(BusinessResponse.self, from: data)
                completion(.success(loginResponse))
            } catch {
                completion(.failure(error))
            }
        }).resume()
    }
    
    
    
    
    
    
}
