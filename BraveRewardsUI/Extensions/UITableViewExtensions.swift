/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import UIKit

protocol TableViewReusable { }

extension TableViewReusable {
  fileprivate static var identifier: String {
    return String(describing: type(of: self))
  }
}

extension UITableView {
  /// Register a UITableViewCell subclass as a dequeable cell
  func register<T: UITableViewCell & TableViewReusable>(_ cellClass: T.Type) {
    register(cellClass, forCellReuseIdentifier: cellClass.identifier)
  }
  /// Register a UITableViewHeaderFooterView subclass as a dequeable section header/footer
  func registerHeaderFooter<T: UITableViewHeaderFooterView & TableViewReusable>(_ headerFooterClass: T.Type) {
    register(headerFooterClass, forHeaderFooterViewReuseIdentifier: headerFooterClass.identifier)
  }
  func dequeueReusableCell<T: UITableViewCell & TableViewReusable>(for indexPath: IndexPath) -> T {
    return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
  }
  func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView & TableViewReusable>() -> T {
    return dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as! T
  }
}
