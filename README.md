# apron-bindings

Layer one bindings to the APRON library. 

## Install dependencies

- [APRON](https://github.com/antoinemine/apron)
- gcc v 10.2. Inexplicably broken with prior versions

If you're on arch linux, you can use apron-git here:
https://aur.archlinux.org/packages/apron-git/

## Build project

When APRON is installed on a standard path (e.g., you got it from the link above), use:

```
stack build
```

When APRON is on a non-standard path, (absolute path) APRON_PATH,
add the following to stack.yaml:

```
extra-lib-dirs:
- APRON_PATH/lib/
extra-include-dirs:
- APRON_PATH/include/
```

Then, you need to pass the extra-lib-dirs path to the configure script like this:

```
LDFLAGS=-LAPRON_PATH/lib/ stack build
```

## Run tests

```
stack test
```

## Examples

The examples/ directory has examples from the corresponding APRON examples file.
You can run examples/ExampleN.hs using: 

```
stack exec <exampleN>
```