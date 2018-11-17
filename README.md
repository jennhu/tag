# Automating synchronous multicomponent tree-adjoining grammar derivations

The system allows a user to specify a synchronous multicomponent tree-adjoining grammar (STAG) using an intuitive, text-based metagrammar. It then automates the specified derivations and outputs the derived trees.

This README is only meant to get you started. Refer to `doc/mctagdoc.pdf` for in-depth documentation. These [slides](https://jennhu.github.io/assets/pdf/LING98aPresentation.slides.pdf) may also be helpful.

## Getting started

### Dependencies
You will need OCaml 4.02 (or later) and Menhir. Refer to the [OCaml docs](https://ocaml.org/docs/install.html) for installation instructions. If you install the package manager [OPAM](https://opam.ocaml.org/) with OCaml (highly recommended), Menhir can be installed with the following command:

```bash
opam install menhir
```

You may compile the files with your favorite OCaml compiler, but I suggest [OCamlbuild](https://github.com/ocaml/ocamlbuild), which can be installed with the following command:

```bash
opam install ocamlbuild
```

### Building
To build all the files for the first time, run the following command:

```bash
ocamlbuild -use-menhir mctag.byte
```

This command creates a `_build` directory within your current working directory. The executables will be stored there, but a symlink should be created in your current directory. If you can't find the target `mctag.byte` file, look under `_build`.

### Usage
To help the user get off the ground, the repo contains several sample grammars in the `grammars` folder. Try running

```bash
./mctag.byte -i grammars/toy.txt
```

to print the derived syntax and semantics trees for the sentence 'John saw a girl'.

<!-- The `-i` flag toggles `interpret` mode. You can also pass the `-c` flag to toggle `compile` mode. This compiles the specified forest and derivations into an `.ml` file. To see the final trees, you will need to separately compile and run the output file. Try running

```bash
./mctag.byte -c grammars/toy.txt toy.ml
ocamlbuild toy.byte
./toy.byte
```

to compile the trees, generate an executable, and then print the derived trees. -->

A full list of example grammars is provided below.

| Path                  | Description                                    |
| --------------------- | ---------------------------------------------- |
| `grammars/toy.txt`    | 'John saw a girl'                              |
| `grammars/example.txt`| Reflexives, topicalization, quantifier scope ambiguity, adjunction at substitution nodes, etc.  |
| `grammars/paper.txt`  | Trees from [Aggazzotti & Shieber (2017)](http://aclweb.org/anthology/W/W17/W17-6204.pdf)       |
| `grammars/features.txt`  | Basic analyses of features -- see doc for more details |

### Writing your own grammars
You can specify your own STAGs using the metagrammar specified in the full documentation under `doc/mctagdoc.pdf`.

## Acknowledgments

This system was developed in collaboration with Stuart Shieber and Cristina Aggazotti during the summer of 2016.
