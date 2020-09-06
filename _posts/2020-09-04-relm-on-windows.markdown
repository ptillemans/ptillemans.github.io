---
layout: post
title:  "Installing Rust Relm on Windows"
date:   2020-09-04 02:07:49 +0200
categories: rust gtk gui
excerpt_separator: <!--more-->
---

# Rust and Gtk on Windows

There are essentially 2 methods for compiling Gtk apps 

 - using *msvc* compiler and .LIB files
 - using "gnu" backend and msys2 libraries

It is a pick your poison situation, the first option requires 
unpacking zip files and organizing stuff so the rust compiler 
can find the libraries and the runtime the DLLs.

The other option requires configuring rust to essentially cross
compile to the *x86_64-pc-windows-gnu* target. 

<!--more-->

Since I know how to cross compile from my recent experiments with 
compiling for embedded ARM processors and I generally know my way 
better around the unixy msys environment, the latter it is.

## Installing Gtk in Msys2/Mingw64

Installing gtk3 is easy as it can be installed with *pacman*

    $ pacman -S mingw64/mingw-w64-x86_64-gtk3

Add some support for integrating with c libraries
and linking, etc... 

    $ pacman -S mingw-w64-x86_64-toolchain base-devel

Being optimistic I installed glade. Probably wont need it today
but it is a good test to see if Gtk apps at least start.

    $ pacman -S mingw-w64-x86_64-glade

Glade starts and shows the GUI so the first milestone was reached.

## Preparing rust and cargo

First install the cross compilation target 

    $ rustup target add x86_64-pc-windows-gnu

I can now compile with

    $ PKG_CONFIG_ALLOW_CROSS=1 cargo build --target=x86_64-pc-windows-gnu

To always enably this environment variable in the project folder I added a *.env* file with

    PKG_CONFIG_ALLOW_CROSS=1

which is picked up by the zsh dotenv plugin when I enter the folder.

Similarly we can change the default target for cargo with adding 

    build]
    target = "x86_64-pc-windows-gnu"

to *.cargo/config.toml

We can now simply do

    $ rust build

or  

    $ rust run


## Using VSCode 

When using *vscode* the rust language server needs to have this enviroment setup too so it can do its magic. For debugging and running you can do this in *launch.json* by setting the variables in the *env* property, but this is (logically) not used for the language server. There seem no way to have *vscode* respect the *.env* file soon enough for the language server to pick it up.

The solution I settled on was to launch *vscode* from the command line in the project folder:

    $ code .

The prompt returns immediately and *vscode* is seeing the same environment as the shell. (This does imply that the vscode bin directory is on the path.)

Of course this wisdom was gained by fixing 1 error message after another while trying to build an example in a 2018 blogpost. In hindsight I could have started with the examples provided with the relm sourcecode, but where would be the fun in that?

