# NE451 - Simulation Methods

This is for attempting to install the DISLIN library for usage in C++ programs
on Mac or Linux.

###Linux Installation Instructions
1. `sudo apt-get install libmotif4 && sudo apt-get install cmake`
2. Download the [DISLIN .deb file](http://www.mps.mpg.de/dislin/linux) for Linux.
    * The installation directory is /usr/local/
    * You should have a `/usr/local/dislin/real64` folder.
    * DONT DO THIS, I NEVER GOT IT WORKING: Rename `/usr/local/dislin/dislin.h` to `dislinold.h`, then copy `/usr/local/dislin/real64/dislin.h` into `/usr/local/dislin/`. This will enable double precision calculations.
3. `git clone https://github.com/chrishajduk84/NE451Simulation/`

###Mac OS X Installation Instructions
NOTE: THIS HAS NOT BEEN THOROUGHLY TESTED

1. `sudo brew install https://gist.githubusercontent.com/steakknife/60a39a32ae84e12238a2/raw/openmotif.rb && sudo brew install cmake`
2. Install the [DISLIN tar.gz file](http://www.mps.mpg.de/dislin/mac-osx-darwin) for Mac
    * Ensure that the installation directory is /usr/local/.
    * You should have a `/usr/local/dislin/`
    * DONT DO THIS, I NEVER GOT IT WORKING: Rename `/usr/local/dislin/dislin.h` to `dislinold.h`, then copy `/usr/local/dislin/real64/dislin.h` into `/usr/local/dislin/`. This will enable double precision calculations.
3. `git clone https://github.com/chrishajduk84/NE451Simulation/`

If it is still not working consider doing the following (MAC only):
export DISLIN=/usr/local/dislin
./INSTALL
add the following to .bash_profile:
# DISLIN
export PATH="/usr/local/dislin/bin:$PATH"
export DYLD_LIBRARY_PATH="/usr/local/dislin:$PATH"

###Compiling your program
For now, you need to add each file you will compile into the CMakeLists.txt
file. It is already configured to compile "main.cpp"

In the project directory do:

1. `mkdir build`
2. `cd build`
3. `cmake ../`
4. `make`

If you don't get any error messages, you are good to go.

If you get an error message, it will likely say `error: no matching function for call to 'qplot'`. This is a result of the fact that you did not rename `/usr/local/dislin/dislin.h` to `dislinold.h`, then copy `/usr/local/dislin/real64/dislin.h` into `/usr/local/dislin/`. As a result, the qplot function does not accept double precision floating point operations. Either copy the file, or change the type for variable `x` and `y` to float.

