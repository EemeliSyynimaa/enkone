UNAME := $(shell uname)
ifeq ($(UNAME), $(filter $(UNAME), Linux))
    OS=linux
else
    OS=windows
endif

GENIE=tools/genie/$(OS)/genie

.PHONY: clean

clean:
    @echo Cleaning...
    -@rm -rf .build
    @mkdir .build

projgen:
    $(GENIE) vs2013
    $(GENIE) vs2015
    $(GENIE) --gcc=linux-gcc gmake
    $(GENIE) --gcc=linux-clang gmake
    
linux-build-gcc:
    $(GENIE) --gcc=linux-gcc gmake
linux-debug64-gcc: linux-build-gcc
    make -C .build/projects/gmake-linux config=debug64 
linux-release64-gcc: linux-build-gcc
    make -C .build/projects/gmake-linux config=release64
linux-gcc: linux-debug64-gcc linux-release64-gcc

linux-build-clang:
    $(GENIE) --gcc=linux-clang gmake
linux-debug64-clang: linux-build-clang
    make -C .build/projects/gmake-linux-clang config=debug64
linux-release64-clang: linux-build-clang
    make -C .build/projects/gmake-linux-clang config=release64
linux-clang: linux-debug64-clang linux-release64-clang

windows-build: 
    $(GENIE) vs2013
    $(GENIE) vs2015