# Gauche filename-comparator

Windows 風のファイル比較処理を行う Gauche 用ライブラリです。
Windows 上ではファイル名は単なる辞書順ではなく数値の箇所は数値として比較する処理が行なわれるので、その処理を真似ました。

## インストール

Gauche のパッケージとしての作法に従っていますので `gauche-package` コマンドでインストールできます。

```
gauche-package install https://github.com/SaitoAtsushi/Gauche-filename-comparator/archive/master.tar.gz
```

### 使い方

プログラムの最初に以下を記述してモジュールをロードします。

```
(use filename-comparator)
```

`filename-comparator` という名前の比較器が導入されます。
比較器の利用方法については Gauche のドキュメントの「[比較器にまつわる述語とアクセサ](http://practical-scheme.net/gauche/man/?l=ja&p=%E6%AF%94%E8%BC%83%E5%99%A8%E3%81%AB%E3%81%BE%E3%81%A4%E3%82%8F%E3%82%8B%E8%BF%B0%E8%AA%9E%E3%81%A8%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B5)」の項目を参照してください。
