# apron-bindings

## Install dependencies

- [APRON](https://github.com/antoinemine/apron)
- gcc v 10.2. Inexplicably broken with prior versions

Note: Do not re-generate the cabal file from the package file.
It won't enforce the correct ordering of modules in the cabal file

## Build project

```
stack build
```

## Run tests

```
stack test
```