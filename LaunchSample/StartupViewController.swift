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

/// The view controller used when launching the App.
final class StartupViewController: UIViewController {

    override func loadView() {
        super.loadView()

        // LaunchScreenを自身のviewに設定する.
        if let launchScreen = LaunchScreenUtil.launchScreen {
            view = launchScreen
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
        // ここまでにLaunchScreen表示中に行いたい処理を記述する.
        // ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
        
        // 3秒後にMainViewControlleに画面遷移する.
        // このViewControllerは解放される.
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let mainViewController = ViewUtil.retrieveViewController(MainViewController.self)
            RootViewControllerSegue(
                source: self,
                destination: mainViewController
            )
            .perform()
        }
    }

    /// MainViewControllerに遷移した後にメモリから解放されることを確認する.
    deinit {
        print("StartupViewController: \(#function)")
    }
}
