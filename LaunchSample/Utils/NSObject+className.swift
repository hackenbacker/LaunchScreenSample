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

import Foundation

/// Extension of NSObject with
extension NSObject {
    
    /// Tells a class name for a class type.
    /// - note: Class.className => "Class"
    class var className: String {
        String(describing: self)
    }
    
    /// Tells a class name for an instance.
    /// - note: Instance.className => "Instance"
    var className: String {
        type(of: self).className
    }
}
