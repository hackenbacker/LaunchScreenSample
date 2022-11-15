/*
 Copyright 2022 Hackenbacker

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import UIKit

/// Utilities for UIView and UIViewController.
struct ViewUtil {
    
    private init() {} // prevent instantiation.

    /// Retrieves a view controller with its name.
    /// - Parameters:
    ///   - viewControllerName: A name of the view controller.
    ///   - storyboardName: A name of storyboard associated with the view controller. Default is nil.
    /// - Returns: Retrieved view controller.
    static func retrieveViewController(_ viewControllerName: String, in storyboardName: String? = nil) -> UIViewController {
        
        let storyboardName: String = storyboardName ?? viewControllerName
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: viewControllerName)
    }
    
    /// Retrieves a view controller with its object type.
    /// - Parameters:
    ///   - clazz: Type of the view controller.
    ///   - storyboardName: A name of storyboard associated with the view controller. Default is nil.
    /// - Returns: Retrieved view controller.
    static func retrieveViewController<T: UIViewController>(_ clazz: T.Type, in storyboardName: String? = nil) -> T {
        retrieveViewController(clazz.className, in: storyboardName) as! T
    }

    /// Returns the key window in the app's window arrays.
    static var keyWindow: UIWindow? {
        if #available(iOS 15.0, *) {
            return UIApplication.shared.connectedScenes
                .filter { $0.activationState == .foregroundActive }
                .compactMap { ($0 as? UIWindowScene)?.keyWindow }
                .first
        } else {
            return UIApplication.shared.connectedScenes
                .filter { $0.activationState == .foregroundActive }
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first { $0.isKeyWindow }
        }
    }

    /// Retrieves a view with its object type.
    /// - Parameters:
    ///   - clazz: Type of the view.
    ///   - fromNib: The name of the nib file.
    /// - Returns: Retrieved view.
    static func retrieveView<T: UIView>(_ clazz: T.Type, fromNib: String? = nil) -> T? {
        let nibName: String = fromNib ?? clazz.className
        let nib = UINib(nibName: nibName, bundle: nil)
        
        if let view = nib.instantiate(withOwner: nil, options: nil)
            .first(where: { ($0 as AnyObject).isKind(of: clazz) }) {
            return (view as! T)
        }
        
        return nil
    }
}
