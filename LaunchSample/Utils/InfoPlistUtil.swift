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

/// Utilities for InfoPlist.
struct InfoPlistUtil {

    private init() {} // prevent instantiation.

    /// Returns the associated value with the specified key.
    /// - Parameter key: A key for the value.
    /// - Returns: The associated value. Returns nil if it does not exist.
    static func objectForKey<T>(_ key: String) -> T? {
        Bundle.main.object(forInfoDictionaryKey: key) as? T
    }

    /// Returns the Dictionary value with the specified key.
    /// - Parameter key: A key for the value.
    /// - Returns: The associated value. Returns nil if it does not exist.
    static func dictionaryForKey(_ key: String) -> [String : Any]? {
        objectForKey(key)
    }

    /// Returns the String value with the specified key.
    /// - Parameter key: A key for the value.
    /// - Returns: The associated value. Returns nil if it does not exist.
    static func stringForKey(_ key: String) -> String? {
        objectForKey(key)
    }

    /// Returns the value of "UILaunchStoryboardName".
    static var launchStoryboardName: String? {
        stringForKey("UILaunchStoryboardName")
    }

    /// Returns the value of "UIApplicationSupportsMultipleScenes" in "UIApplicationSceneManifest".
    static var isApplicationSupportMultipleScenes: Bool? {
        if let manifest = dictionaryForKey("UIApplicationSceneManifest") {
            return manifest["UIApplicationSupportsMultipleScenes"] as? Bool
        } else {
            return nil
        }
    }
}
