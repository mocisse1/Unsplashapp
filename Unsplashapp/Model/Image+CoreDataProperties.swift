//
//  Image+CoreDataProperties.swift
//  Unsplashapp
//
//  Created by Mamoudou Cisse on 3/23/23.
//
//

import Foundation
import CoreData


extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
        return NSFetchRequest<Image>(entityName: "Image")
    }

    @NSManaged public var id: Int64

}

extension Image : Identifiable {

}
