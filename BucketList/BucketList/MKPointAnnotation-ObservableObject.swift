//
//  MKPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by SK Ruban on 2/6/20.
//  Copyright © 2020 SK Ruban. All rights reserved.
//

import Foundation
import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }

        set {
            title = newValue
        }
    }

    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        }

        set {
            subtitle = newValue
        }
    }
}

