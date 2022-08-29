# What is this? / これはなに？
Sample of initialization while continuing to display LaunchScreen at startup.<br>
起動時にLaunchScreenを表示し続けながら初期化するサンプルです。

# What I want to do / やりたいこと
![S12019-09-17 6.11.02.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/95033/36f1101f-b91a-7e3e-3c6a-977ed1aadfc3.png)

After the LaunchScreen is displayed, StartupViewController is launched for initialization **without changing the screen**.<br>
After initialization is completed, it transitions to MainViewController.

LaunchScreenを表示した後、**画面はそのままで**初期化用のStartupViewControllerを起動します。<br>
初期化終了後にMainViewControllerへ遷移します。

# How it works / どうやっているのか？
![003.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/95033/5e3dd77e-081a-2e91-d05f-69c42140e4a5.png)
<p>
1. Instantiate LaunchScreen with a ViewController and get its view.<br>
2. Prepare a variable retainedView to reference LaunchScreen to prevent the number of references from becoming zero.<br>
3. Cut the reference from the unnamed ViewController to LaunchScreen.<br>
4. Assign LaunchScreen to StartupViewController.<br>
</p>
<p>
1. LaunchScreenをViewControllerごとインスタンス化してそのviewを取得します。<br>
2. 変数retainedViewを用意してLaunchScreenを参照することで参照数が0になることを防ぎます。<br>
3. 無名ViewControllerからLaunchScreenへの参照を切ります。<br>
4. LaunchScreenをStartupViewControllerに割り当てます。<br>
</p>

# For more details / 詳細はこちら
[Qiita (written in Japanese) LaunchScreenを表示したままにしてViewControllerを動かす](https://qiita.com/Hackenbacker/items/8abcdbb77c42f3670749)

# Execution Environment / 実行環境
Xcode 13.4.1<br>
iOS 13.0 or later
