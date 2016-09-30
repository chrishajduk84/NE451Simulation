cmake_minimum_required(VERSION 3.0)

project(NE451-Test CXX C)

#Adds a custom FIND<MODULE>.CMAKE folder to the project
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")

# Dependencies
find_package(DISLIN REQUIRED)

message(status " DISLIN found:" ${DISLIN_FOUND})
message(status " DISLIN IncludeDirs:" ${DISLIN_INCLUDE_DIRS})
message(status " DISLIN Libraries:" ${DISLIN_LIBRARIES})

set(CMAKE_CXX_STANDARD 11)

if (UNIX)
    message(status "Setting GCC flags")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fexceptions -Wall -Wextra")
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -mtune=native")
else()
    message(status "Setting MSVC flags")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /EHc-")
endif()
message(status " CMAKE_CXX_FLAGS_DEBUG: ${CMAKE_CXX_FLAGS_DEBUG}")
message(status " CMAKE_CXX_FLAGS_RELEASE: ${CMAKE_CXX_FLAGS_RELEASE}")

set(CMAKE_SHARED_LINKER_FLAGS "-Wluser32 -Wlgdi32 -Wlopengl32 -Wstatic-libgcc")

include_directories(${DISLIN_INCLUDE_DIRS})

add_executable(NE451Test main.cpp)
target_link_libraries(NE451Test ${DISLIN_LIBRARIES}) 
install(TARGETS NE451Test DESTINATION bin)

