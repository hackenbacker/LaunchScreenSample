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

/// An object to perform transition to the specified view controller as a root view controller.
final class RootViewControllerSegue: UIStoryboardSegue {

    convenience init(source: UIViewController, destination: UIViewController) {
        self.init(identifier: nil, source: source, destination: destination)
    }

    override func perform() {

        guard let keyWindow = ViewUtil.keyWindow else { return }

        keyWindow.rootViewController = destination
        keyWindow.makeKeyAndVisible()
    }
}
