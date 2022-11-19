//
//  LayoutConstraintHelper.swift
//  BabbelWordGame
//
//  Created by Yasir Romaya on 11/19/22.
//

import Foundation
import UIKit


@propertyWrapper
public struct UsesAutoLayout<T: UIView> {
    public var wrappedValue: T {
        didSet {
            wrappedValue.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
}
