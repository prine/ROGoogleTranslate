//
//  ROGoogleTranslate.swift
//  ROGoogleTranslate
//
//  Created by Robin Oster on 20/10/16.
//  Copyright © 2016 prine.ch. All rights reserved.
//

import Foundation

/// MARK: - ROGoogleTranslateParams

/// Struct translate
public struct ROGoogleTranslateParams {
    
    var source: String
    var target: String
    var text:   String
}

/// MARK: - ROGoogleTranslate

/// Offers easier access to the Google Translate API
open class ROGoogleTranslate {
    
    /// Store here the Google Translate API Key
    public var apiKey: String
    
    /// Initial constructor
    ///
    /// - Parameter apiKey: String
    public init(with apiKey: String) {
        self.apiKey = apiKey
    }
    
    ///
    /// Translate a phrase from one language into another
    ///
    /// - parameter params:   ROGoogleTranslate Struct contains all the needed parameters to translate with the Google Translate API
    /// - parameter callback: The translated string will be returned in the callback
    ///
    open func translate(params: ROGoogleTranslateParams, callback: @escaping (_ translatedText: String) -> ()) {

        guard
            let urlEncodedText = params.text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
            let url            = URL(string: "https://www.googleapis.com/language/translate/v2?key=\(self.apiKey)&q=\(urlEncodedText)&source=\(params.source)&target=\(params.target)") else {
                return
        }
        
        let httprequest = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            guard error == nil, (response as? HTTPURLResponse)?.statusCode == 200 else {
                print("Something went wrong: \(String(describing: error?.localizedDescription))")
                return
            }
            
            do {
                guard
                    let data            = data,
                    let json            = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary,
                    let jsonData        = json["data"]                  as? [String : Any],
                    let translations    = jsonData["translations"]      as? [NSDictionary],
                    let translation     = translations.first            as? [String : Any],
                    let translatedText  = translation["translatedText"] as? String
                    else {
                        return
                }
                callback(translatedText)
                
            } catch {
                print("Serialization failed: \(error.localizedDescription)")
            }
        })
        
        httprequest.resume()
    }
}
