# 使い方

## elixir: Hello World

```
$ elixir -r Greeting.ex -r Example.ex -e 'IO.gets("Name: ") |> Sayings.Example.greeting |> IO.puts'
```

## mix: ジュースの値段

```bash
$ mix deps.get
$ mix compile
$ mix run sample_cli.ex cl Juice --price 2000 --taxRate 1.05
```

## iex: 動物あてクイズ

```bash
$ mix compile
$ iex -S mix
iex> IO.gets("動物の名前を入れてね: ") |> Lesson.Animals.search |> IO.puts
iex> (Ctrl + \を押してiexを終了)
```

## iex:　動物画像検索

```
vi lib/LessonApiDriver.ex # Custom Search APIのCSE ID, API KEYを設定
defmodule Lesson.ApiDriver do
    @cx "/*CSE ID*/"
    @apikey "/*API KEY*/"

$ iex -S mix

iex (1)> Lesson.AnimalsCli.main
```

## Unit test

```bash
MIX_ENV=test mix compile && mix test && mix coveralls
```

## Linter

```bash
$ mix format lib/Animals.ex
```

## IEx Helper

```bash
$ iex -S mix
iex(1)> h()
iex(2)> i(Enum.__info__(:functions))
iex(3)> h(Enum.any?)
iex(4)> i(Lesson.Animals.__info__(:functions)) # 自作モジュールの関数リストを表示
iex(5)> h(Lesson.Animals.search) # 自作関数のヘルプドキュメントを表示
```

## [Httpclient](https://github.com/edgurgel/httpoison)

```bash
$ vi mix.exs # add deps httpoison {:httpoison, "~> 1.2"}, add :httpoison to applications.
$ mix deps.get # install httpoison
```

## [Mojiex](https://github.com/enpedasi/Mojiex)

```bash
$ vi mix.exs # add deps mojiex {:mojiex, github: "enpedasi/mojiex"},
$ mix deps.get # install mojiex
```

## [GoogleApi](https://github.com/GoogleCloudPlatform/elixir-google-api)

```bash
$ vi mix.exs # add deps mojiex {::google_api_custom_search,"~> 0.0.1"}, {:goth, ">= 0.9.0"}
$ mix deps.get # install google_api_custom_search, goth
```
# elixir
