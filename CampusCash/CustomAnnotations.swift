//
//  CustomAnnotations.swift
//  CampusCash
//
//  Created by Tyler Jordan Cagle on 10/12/17.
//  Copyright © 2017 Hans von Clemm. All rights reserved.
//

import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var phone: String!
    var name: String!
    var image: UIImage!
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
