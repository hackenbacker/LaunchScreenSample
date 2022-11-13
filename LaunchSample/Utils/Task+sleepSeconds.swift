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

/// Extends Task with sleep in seconds.
/// Taskを拡張し、sleepを秒単位で指定できるようにしました。
extension Task where Success == Never, Failure == Never {

    /// Suspends the current task for at least the given duration in seconds.
    /// - Parameter seconds: Suspending time in seconds.
    static func sleep<T>(seconds: T) async throws where T:BinaryInteger {
        if #available(iOS 16.0, *) {
            try await Task.sleep(until: .now + .seconds(seconds), clock: .continuous)
        } else {
            try await Task.sleep(nanoseconds: UInt64(seconds) * 1_000_000_000)
        }
    }
}
