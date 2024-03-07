# PHP build environment 〜php-srcを読める環境がサクッと欲しい方へ〜 

## PHP build environmentとは

本リポジトリは、[php-src](https://github.com/php/php-src)をビルドするためのdocker環境を提供するリポジトリです。

PHPerkaigi 2024にて、「php-src debug マニュアル」というタイトルで発表させていただきました。

https://fortee.jp/phperkaigi-2024/proposal/26fcb764-0a5a-4759-9cb7-d8f14814e97a

https://speakerdeck.com/onopon/php-src-debug-maniyuaru

## 環境構築方法

1. Dockerコマンドを利用できる状況にしてください。
2. 下記コマンドを実行してください。必要なdockerを立ち上げ、初期準備、及びphp-srcのビルドを行います。

```
sh ./initial_run.sh
```

## initial_run.sh によりできる環境

php-srcをcloneし、sandboxというコンテナを作成します。
sandbox経由でphp-srcを開くことで、php-srcのデバッグを行うことができます。

## 2回目以降のsandboxコンテナの立ち上げ方法

下記コマンドを実行してください。

```
docker-compose up -d
```

## dockerの終了のさせ方

下記コマンドを実行してください。

```
docker-compose down
```

## sandboxコンテナ内でbashシェルを利用する方法

下記コマンドを実行してください。

```
docker-compose exec sandbox bash
```

また、

```
./sandbox
```

を実行しても同様のことを行えます。

## Visual Studio Codeでphp-srcを開く方法

Visual Studio Codeを開き、「リモートエクスプローラー」を選択します。

<img width="612" alt="image" src="https://github.com/onopon/php_build_environment/assets/7286047/655585a0-3e6a-4624-a75d-e889dc754b4a">

`php_build_environment sandbox` を選択し、現在のウィンドウまたは新しいウィンドウでアタッチしてください。

<img width="612" alt="image" src="https://github.com/onopon/php_build_environment/assets/7286047/adc5b1b1-b5f2-4375-bf7c-c20024c83f3d">

## 実行方法

initial_run.sh を叩いた際、test.php がphp-srcリポジトリ内にコピーされます。

そちらのファイルを利用して、php-srcでのphpの実行やdebugを行えます。

### RUN

test.php を開き、右上の▷を押下することで実行できます。

出力結果は、デバッグ コンソールで確認できます。

<img width="612" alt="image" src="https://github.com/onopon/php_build_environment/assets/7286047/aa15e2eb-5067-4190-a29a-27904ffb33a9">

### DEBUG

ast\parse_code を行うことで、php-src/Zend/zend_compile.c の zend_compile_stmt メソッド内でのswitchのcaseを確認することができます。

例えば、 `echo` のkindは283です。

switch の case ZEND_AST_XXXX にカーソルをおくと値の確認を行えるので、ast\parse_code で見つけたkindと同じ値のポイントにブレイクポイントを仕込むことで、確認したい挙動のロジックを確認することができます。

enumを読みにいくこともできますが、Visual Studioの場合はZEND_AST_XXXX にカーソルを置いた方が素早く確認できると思います。

<img width="612" alt="image" src="https://github.com/onopon/php_build_environment/assets/7286047/21cb775c-e874-492c-ba51-89d9a21e11bd">

適当なところ（例では `zend_compile_echo` メソッド）でブレイクポイントを仕込み、左のタブで「実行とデバッグ」を選択します。

Launch Main の左の▷を押下するとデバッグが開始し、仕込んだブレイクポイントのタイミングで止まります。

<img width="612" alt="image" src="https://github.com/onopon/php_build_environment/assets/7286047/423bd874-2518-41b6-93e7-a914bafacba3">
