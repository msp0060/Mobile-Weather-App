//
//  UIApplication+Extension.swift
//  Mobile Weather App
//
//  Modified by Michael Peek from code Created by Stewart Lynch on 2021-01-18.
//  Prior code was based on an older API and JSON file no longer available.
//  Additional features and information were added available from the newer API's.
//  Example weather is shown every 3 hours with a time stamp as well and added wind speed.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
