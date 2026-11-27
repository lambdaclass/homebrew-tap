# Lambdaclass Tap

## How do I install these formulae?

`brew install lambdaclass/tap/ethrex` or `brew install lambdaclass/tap/ethlambda`

Or `brew tap lambdaclass/tap` and then `brew install ethrex` or `brew install ethlambda`.

`ethlambda` embeds ethrex as the beacon node's execution client.
`ethlambda-minimal` is the same client without it, for running beside an
external execution client (or none). Both install a binary named `ethlambda`,
so only one of them can be installed at a time.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "lambdaclass/tap"
brew "ethrex"
brew "ethlambda"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
