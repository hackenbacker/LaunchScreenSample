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

/// Utilities for LaunchScreen.
struct LaunchScreenUtil {
    
    private init() {} // prevent instantiation.
    
    /// Returns the launch screen's view. (not including a view controller)
    /// See: https://qiita.com/Hackenbacker/items/8abcdbb77c42f3670749   (written in Japanese)
    static var launchScreen: UIView? {
        guard let name = InfoPlistUtil.launchStoryboardName else {
            return nil
        }
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()
        let retainedView = viewController?.view // retain Launch Screen
        viewController?.view = nil // Cut reference from viewController to Launch Screen
        return retainedView
    }
}
