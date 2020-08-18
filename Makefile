deps/apron-dist:
	-git submodule update
	cd deps/apron && ./configure -no-cxx -no-java -no-ocamlfind -no-ocaml-plugins -no-ppl -prefix ../../apron-dist && make && make install
