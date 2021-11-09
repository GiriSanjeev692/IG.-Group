//
//  UITableView+Reuseble.swift
//  UITableView+Reuseble
//
//  Created by Sanjeev Kumar on 31/11/09.
//

import Foundation
import UIKit

public extension UITableView {
    /**
     Register a NIB-Based `UITableViewCell` subclass (conforming to `Reusable` & `NibLoadable`)

     - parameter cellType: the `UITableViewCell` (`Reusable` & `NibLoadable`-conforming) subclass to register

     - seealso: `register(_:,forCellReuseIdentifier:)`
     */
    final func register<T: UITableViewCell>(cellType: T.Type)
        where T: Reusable & NibLoadable {
        register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

    /**
     Register a Class-Based `UITableViewCell` subclass (conforming to `Reusable`)

     - parameter cellType: the `UITableViewCell` (`Reusable`-conforming) subclass to register

     - seealso: `register(_:,forCellReuseIdentifier:)`
     */
    final func register<T: UITableViewCell>(cellType: T.Type)
        where T: Reusable {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

    /**
     Returns a reusable `UITableViewCell` object for the class inferred by the return-type

     - parameter indexPath: The index path specifying the location of the cell.
     - parameter cellType: The cell class to dequeue

     - returns: A `Reusable`, `UITableViewCell` instance

     - note: The `cellType` parameter can generally be omitted and infered by the return type,
     except when your type is in a variable and cannot be determined at compile time.
     - seealso: `dequeueReusableCell(withIdentifier:,for:)`
     */
    final func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T
        where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError(
                "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
                    + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                    + "and that you registered the cell beforehand"
            )
        }
        return cell
    }

    final func dequeueReusableCell<T: UITableViewCell>(cellType: T.Type = T.self) -> T
        where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier) as? T else {
            fatalError(
                "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
                    + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                    + "and that you registered the cell beforehand"
            )
        }
        return cell
    }

    /**
     Register a NIB-Based `UITableViewHeaderFooterView` subclass (conforming to `Reusable` & `NibLoadable`)

     - parameter headerFooterViewType: the `UITableViewHeaderFooterView` (`Reusable` & `NibLoadable`-conforming)
     subclass to register

     - seealso: `register(_:,forHeaderFooterViewReuseIdentifier:)`
     */
    final func register<T: UITableViewHeaderFooterView>(headerFooterViewType: T.Type)
        where T: Reusable & NibLoadable {
        register(headerFooterViewType.nib, forHeaderFooterViewReuseIdentifier: headerFooterViewType.reuseIdentifier)
    }

    /**
     Register a Class-Based `UITableViewHeaderFooterView` subclass (conforming to `Reusable`)

     - parameter headerFooterViewType: the `UITableViewHeaderFooterView` (`Reusable`-confirming) subclass to register

     - seealso: `register(_:,forHeaderFooterViewReuseIdentifier:)`
     */
    final func register<T: UITableViewHeaderFooterView>(headerFooterViewType: T.Type)
        where T: Reusable {
        register(headerFooterViewType.self, forHeaderFooterViewReuseIdentifier: headerFooterViewType.reuseIdentifier)
    }

    /**
     Returns a reusable `UITableViewHeaderFooterView` object for the class inferred by the return-type

     - parameter viewType: The view class to dequeue

     - returns: A `Reusable`, `UITableViewHeaderFooterView` instance

     - note: The `viewType` parameter can generally be omitted and infered by the return type,
     except when your type is in a variable and cannot be determined at compile time.
     - seealso: `dequeueReusableHeaderFooterView(withIdentifier:)`
     */
    final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ viewType: T.Type = T.self) -> T?
        where T: Reusable {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: viewType.reuseIdentifier) as? T? else {
            fatalError(
                "Failed to dequeue a header/footer with identifier \(viewType.reuseIdentifier) "
                    + "matching type \(viewType.self). "
                    + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                    + "and that you registered the header/footer beforehand"
            )
        }
        return view
    }
}

