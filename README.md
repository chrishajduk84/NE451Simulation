# NE451 - Simulation Methods

This is for attempting to install the DISLIN library for usage in C++ programs
on Mac or Linux.

###Linux Installation Instructions
1. `sudo apt-get install libmotif4 && sudo apt-get install cmake`
2. Download the [DISLIN .deb file](http://www.mps.mpg.de/dislin/linux) for Linux or the 
    * The installation directory is /usr/local/
    * You should have a `/usr/local/dislin/real64` folder.
3. `git clone https://github.com/chrishajduk84/NE451Simulation/`

###Mac OS X Installation Instructions
NOTE: THIS HAS NOT BEEN TESTED
1. `sudo brew install libmotif4 && sudo brew install cmake`
2. Install the [DISLIN tar.gz file](http://www.mps.mpg.de/dislin/mac-osx-darwin) for Mac
    * Ensure that the installation directory is /usr/local/.
    * You should have a `/usr/local/dislin/real64` folder.
3. `git clone https://github.com/chrishajduk84/NE451Simulation/`

###Compiling your program
For now, you need to add each file you will compile into the CMakeLists.txt
file. It is already configured to compile "main.cpp"

In the project directory do:

1. `mkdir build`
2. `cd build`
3. `cmake ../`
4. `make`

If you don't get any error messages, you are good to go.


