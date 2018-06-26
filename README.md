# 使い方

## usages

```
mix deps.get
mix compile
mix run sample_cli.ex cl Juice --price 2000 --taxRate 1.05
```

## unit test

```
MIX_ENV=test mix compile && mix test && mix coveralls
```
